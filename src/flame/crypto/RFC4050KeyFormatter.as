////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2011 Ruben Buniatyan. All rights reserved.
//
//  This source is subject to the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package flame.crypto
{
	import flame.numerics.BigInteger;
	
	import flash.utils.ByteArray;
	import flash.utils.getQualifiedClassName;
	
	import mx.resources.IResourceManager;
	import mx.resources.ResourceManager;

	[ResourceBundle("flameLocale")]
	internal final class RFC4050KeyFormatter
	{
		//--------------------------------------------------------------------------
		//
		//  Fields
		//
		//--------------------------------------------------------------------------
		
		private static const DOMAIN_PARAMETERS_ELEMENT:String = "DomainParameters";
		private static const ECDH_ROOT_ELEMENT:String = "ECDHKeyValue";
		private static const ECDSA_ROOT_ELEMENT:String = "ECDSAKeyValue";
		private static const NAMED_CURVE_ELEMENT:String = "NamedCurve";
		private static const P256_URN:String = "urn:oid:1.2.840.10045.3.1.7";
		private static const P384_URN:String = "urn:oid:1.3.132.0.34";
		private static const P521_URN:String = "urn:oid:1.3.132.0.35";
		private static const PUBLIC_KEY_ELEMENT:String = "PublicKey";
		private static const ROOT_NAMESPACE:String = "http://www.w3.org/2001/04/xmldsig-more#";
		private static const URN_ATTRIBUTE:String = "URN";
		private static const URN_ATTRIBUTE_PREFIX:String = "urn:oid:";
		private static const VALUE_ATTRIBUTE:String = "Value";
		private static const X_ELEMENT:String = "X";
		private static const Y_ELEMENT:String = "Y";
		
		private static var _resourceManager:IResourceManager = ResourceManager.getInstance();
		
		//--------------------------------------------------------------------------
		//
		//  Internal methods
		//
		//--------------------------------------------------------------------------
		
		internal static function fromXMLString(value:String):ECCParameters
		{
			var xml:XML = new XML(value);

			return readPublicKey(xml.children().(localName() == PUBLIC_KEY_ELEMENT), ECCParameters.getKeySizeByCurveOID(readAlgorithm(xml)));
		}
		
		internal static function toXMLString(parameters:ECCParameters):String
		{
			var rootElement:String;
			
			switch (parameters.algorithmName)
			{
				case getQualifiedClassName(ECDiffieHellman):
				
					rootElement = ECDH_ROOT_ELEMENT;
					break;
				
				case getQualifiedClassName(ECDSA):
					
					rootElement = ECDSA_ROOT_ELEMENT;
					break;
				
				default:
					
					throw new CryptoError(_resourceManager.getString("flameLocale", "cryptoUnknownECAlgorithm"));
			}
			
			var xml:XML =
				<{rootElement} xmlns={ROOT_NAMESPACE}>
					{writeDomainParameters(parameters, parameters.keySize)}
					{writePublicKey(parameters)}
				</{rootElement}>;
			
			return xml.toXMLString();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		private static function readAlgorithm(xml:XML):String
		{
			if (xml.namespace().toString() != ROOT_NAMESPACE)
				throw new ArgumentError(_resourceManager.getString("flameLocale", "cryptoUnexcpectedXMLNamespace", [ xml.namespace().toString(), ROOT_NAMESPACE ]));
			
			var rootElement:String = xml.localName();
			
			if (rootElement != ECDH_ROOT_ELEMENT && rootElement != ECDSA_ROOT_ELEMENT)
				throw new ArgumentError(_resourceManager.getString("flameLocale", "cryptoUnknownECAlgorithm"));
			
			var domainParameters:XMLList = xml.children().(localName() == DOMAIN_PARAMETERS_ELEMENT);
			
			if (domainParameters.length() == 0)
				throw new ArgumentError(_resourceManager.getString("flameLocale", "cryptoMissingDomainParameters"));
			
			var namedCurve:XMLList = domainParameters.children().(localName() == NAMED_CURVE_ELEMENT);
			
			if (namedCurve.length() == 0)
				throw new ArgumentError(_resourceManager.getString("flameLocale", "cryptoMissingDomainParameters"));
			
			var urn:XMLList = namedCurve.attributes().(localName() == URN_ATTRIBUTE);
			
			if (urn.length() == 0)
				throw new ArgumentError(_resourceManager.getString("flameLocale", "cryptoMissingDomainParameters"));
			
			return urn.toString().substring(URN_ATTRIBUTE_PREFIX.length);
		}
		
		private static function readPublicKey(xml:XMLList, keySize:int):ECCParameters
		{
			if (xml.length() == 0)
				throw new ArgumentError(_resourceManager.getString("flameLocale", "cryptoMissingPublicKey"));
			
			var x:XMLList = xml.children().(localName() == X_ELEMENT);
			
			if (x.length() == 0)
				throw new ArgumentError(_resourceManager.getString("flameLocale", "cryptoMissingPublicKey"));
			
			x = x.attributes().(localName() == VALUE_ATTRIBUTE);
			
			if (x.length() == 0 || !x.toString())
				throw new ArgumentError(_resourceManager.getString("flameLocale", "cryptoMissingPublicKey"));
			
			var y:XMLList = xml.children().(localName() == Y_ELEMENT);
			
			if (y.length() == 0)
				throw new ArgumentError(_resourceManager.getString("flameLocale", "cryptoMissingPublicKey"));
			
			y = y.attributes().(localName() == VALUE_ATTRIBUTE);
			
			if (y.length() == 0 || !y.toString())
				throw new ArgumentError(_resourceManager.getString("flameLocale", "cryptoMissingPublicKey"));
			
			var keySizeInBytes:int = (keySize + 7) / 8;
			var parameters:ECCParameters = new ECCParameters();
			
			parameters.x = CryptoUtil.ensureLength(new BigInteger(x.toString()).toByteArray(), keySizeInBytes);
			parameters.y = CryptoUtil.ensureLength(new BigInteger(y.toString()).toByteArray(), keySizeInBytes);
			
			return parameters;
		}
		
		private static function writeDomainParameters(parameters:ECCParameters, keySize:int):XML
		{
			var xml:XML =
				<{DOMAIN_PARAMETERS_ELEMENT}>
					<{NAMED_CURVE_ELEMENT} {URN_ATTRIBUTE}={URN_ATTRIBUTE_PREFIX + ECCParameters.getCurveOIDByKeySize(keySize)} />
				</{DOMAIN_PARAMETERS_ELEMENT}>;
			
			return xml;
		}
		
		private static function writePublicKey(parameters:ECCParameters):XML
		{
			var buffer:ByteArray = new ByteArray();
			
			buffer.writeByte(0);
			buffer.writeBytes(parameters.x);
			
			var x:String = new BigInteger(buffer).toString();
			
			buffer.clear();
			buffer.writeByte(0);
			buffer.writeBytes(parameters.y);
			
			var y:String = new BigInteger(buffer).toString();
			
			var xml:XML =
				<{PUBLIC_KEY_ELEMENT}>
					<{X_ELEMENT} {VALUE_ATTRIBUTE}={x} xsi:Type="PrimeFieldElemType" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" />
					<{Y_ELEMENT} {VALUE_ATTRIBUTE}={y} xsi:Type="PrimeFieldElemType" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" />
				</{PUBLIC_KEY_ELEMENT}>;
			
			return xml;
		}
	}
}