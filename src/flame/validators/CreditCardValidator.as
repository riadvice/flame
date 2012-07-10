////////////////////////////////////////////////////////////////////////////////
//
//  Copyright 2010 Ruben Buniatyan. All rights reserved.
//
//  This source is subject to the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package flame.validators
{
	import flash.events.Event;
	
	import mx.events.ValidationResultEvent;
	import mx.validators.CreditCardValidator;

	/**
	 * The CreditCardValidator is an enhancment to the standard CreditCardValidator.
	 * It provides a bindability and adds an ability to specify a description for the associated source.
	 * 
	 * @see mx.validators.CreditCardValidator
	 */
	public class CreditCardValidator extends mx.validators.CreditCardValidator implements IBindableValidator
	{
		//--------------------------------------------------------------------------
	    //
	    //  Fields
	    //
	    //--------------------------------------------------------------------------
	    
		private var _isValid:Boolean = false;
		private var _sourceDescription:String;
		
		//--------------------------------------------------------------------------
	    //
	    //  Constructor
	    //
	    //--------------------------------------------------------------------------
	    
		/**
		 * Initializes a new instance of the CreditCardValidator class.
		 */
		public function CreditCardValidator()
		{
			super();
			
			addEventListener(ValidationResultEvent.INVALID, validationResultEventHandler);	
			addEventListener(ValidationResultEvent.VALID, validationResultEventHandler);
		}
		
		//--------------------------------------------------------------------------
	    //
	    //  Public properties
	    //
	    //--------------------------------------------------------------------------
	    
		[Bindable("isValidChange")]
		
		/**
		 * Gets or sets a value that indicates whether the associated source passes validation.
		 */
		public function get isValid():Boolean
		{
			return _isValid;
		}
		
		[Inspectable(category="General")]
		
		/**
		 * Gets or sets the description for the associated source.
		 */
		public function get sourceDescription():String
		{
			return _sourceDescription;
		}
		
		/**
		 * @private 
		 */
		public function set sourceDescription(value:String):void
		{
			_sourceDescription = value;
		}
		
		//--------------------------------------------------------------------------
	    //
	    //  Private methods
	    //
	    //--------------------------------------------------------------------------
		
		private function validationResultEventHandler(event:ValidationResultEvent):void
		{
			if (_isValid != (event.type == ValidationResultEvent.VALID))
			{
				_isValid = !_isValid;
				
				dispatchEvent(new Event("isValidChange"));
			}
		}
	}
}