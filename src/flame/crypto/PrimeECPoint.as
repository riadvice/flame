package flame.crypto
{
	import flame.core.flame_internal;
	import flame.numerics.BigInteger;

	internal class PrimeECPoint extends ECPoint
	{
		//--------------------------------------------------------------------------
		//
		//  Fields
		//
		//--------------------------------------------------------------------------
		
		private static const TWO:BigInteger = new BigInteger(2);
		private static const THREE:BigInteger = new BigInteger(3);
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function PrimeECPoint(curve:EllipticCurve, x:ECFieldElement, y:ECFieldElement)
		{
			super(curve, x, y);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Internal methods
		//
		//--------------------------------------------------------------------------
		
		internal override function add(value:ECPoint):ECPoint
		{
			if (isAtInfinity)
				return value;
			
			if (value.isAtInfinity)
				return this;
			
			if (_x.equals(value.x))
			{
				if (_y.equals(value.y))
					return double();
				
				return _curve.pointAtInfinity;
			}
			
			var t:ECFieldElement = value.y.subtract(_y).divide(value.x.subtract(_x));
			var x2:ECFieldElement = t.square().subtract(_x).subtract(value.x);
			var y2:ECFieldElement = t.multiply(_x.subtract(x2)).subtract(_y);
			
			return new PrimeECPoint(_curve, x2, y2);
		}
		
		internal override function double():ECPoint
		{
			if (isAtInfinity)
				return this;
			
			if (_y.toBigInteger().sign == 0)
				return _curve.pointAtInfinity;
			
			var two:ECFieldElement = _curve.bigIntegerToFieldElement(TWO);
			var three:ECFieldElement = _curve.bigIntegerToFieldElement(THREE);
			var t:ECFieldElement = _x.square().multiply(three).add(_curve.a).divide(_y.multiply(two));
			var x2:ECFieldElement = t.square().subtract(_x.multiply(two));
			var y2:ECFieldElement = t.multiply(_x.subtract(x2)).subtract(_y);
			
			return new PrimeECPoint(_curve, x2, y2);
		}
		
		internal override function multiply(value:BigInteger):ECPoint
		{
			if (value.sign < 0)
				throw new CryptoError(_resourceManager.getString("flameLocale", "cryptoInvalidParameter"));
			
			if (isAtInfinity)
				return this;
			
			if (value.sign == 0)
				return _curve.pointAtInfinity;
			
//			var e:BigInteger = value;
//			var h:BigInteger = e.multiply(THREE);
//			var n:ECPoint = negate();
//			var result:ECPoint = this;
//			
//			for (var i:int = h.flame_internal::bitLength - 2; i > 0; i--)
//			{
//				result = result.double();
//				
//				var isHBitSet:Boolean = h.flame_internal::isBitSet(i);
//				
//				if (e.flame_internal::isBitSet(i) != isHBitSet)
//					result = result.add(isHBitSet ? this : n);
//			}return result;
			
			if (_multiplier == null)
				_multiplier = new ECPointWNAFMultiplier(this);
			
			return super.multiply(value);
		}
		
		internal override function negate():ECPoint
		{
			return new PrimeECPoint(_curve, _x, _y.negate());
		}
		
		internal override function subtract(value:ECPoint):ECPoint
		{
			if (isAtInfinity)
				return this;
			
			return add(value.negate());
		}
	}
}