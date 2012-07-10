////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2010 Ruben Buniatyan. All rights reserved.
//
//  This source is subject to the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package flame.crypto
{
	import flash.utils.ByteArray;
	
	/**
	 * Performs symmetric encryption and decryption using the Advanced Encryption Standard (AES) algorithm.
	 * This class cannot be inherited.
	 */
	public final class AES extends SymmetricAlgorithm
	{
		//--------------------------------------------------------------------------
	    //
	    //  Constructor
	    //
	    //--------------------------------------------------------------------------
	    
		/**
		 * Initializes a new instance of the AES class.
		 */
		public function AES()
		{
			super();
			
			_blockSize = _feedbackSize = 128;
			_keySize = 256;
			
			_legalBlockSizes = new <KeySizes>[ new KeySizes(128, 128, 0) ];
			_legalBlockSizes.fixed = true;
			
			_legalKeySizes = new <KeySizes>[ new KeySizes(128, 256, 64) ];
			_legalKeySizes.fixed = true;
		}
		
		//--------------------------------------------------------------------------
	    //
	    //  Public methods
	    //
	    //--------------------------------------------------------------------------
	    
		/**
		 * Creates a symmetric AES decryptor object using the specified key and initialization vector (IV).
		 * 
		 * @param key The secret key to use for the symmetric algorithm.
		 * 
		 * @param iv The initialization vector to use for the symmetric algorithm.
		 * 
		 * @return A symmetric AES decryptor object.
		 */
		public override function createDecryptor(key:ByteArray = null, iv:ByteArray = null):ICryptoTransform
		{
			return createTransform(key, iv, false);
		}
		
		/**
		 * Creates a symmetric AES encryptor object using the specified key and initialization vector (IV).
		 * 
		 * @param key The secret key to use for the symmetric algorithm.
		 * 
		 * @param iv The initialization vector to use for the symmetric algorithm.
		 * 
		 * @return A symmetric AES encryptor object.
		 */
		public override function createEncryptor(key:ByteArray = null, iv:ByteArray = null):ICryptoTransform
		{
			return createTransform(key, iv, true);
		}
		
		/**
		 * Generates a random initialization vector (IV) to use for the algorithm.
		 */
		public override function generateIV():void
		{
			_iv = RandomNumberGenerator.getBytes(_blockSize >> 3);
		}
		
		/**
		 * Generates a random key to use for the algorithm.
		 */
		public override function generateKey():void
		{
			_key = RandomNumberGenerator.getBytes(_keySize >> 3);
		}
		
		//--------------------------------------------------------------------------
	    //
	    //  Private methods
	    //
	    //--------------------------------------------------------------------------
	    
		private function createTransform(key:ByteArray, iv:ByteArray, useEncryptMode:Boolean):ICryptoTransform
		{
			return new RijndaelTransform(key || super.key, mode, iv || super.iv, blockSize, feedbackSize, padding, useEncryptMode); 
		}
	}
}