package data 
{
	import utils.Enumerable;
	import utils.Utils;
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class ScaleType extends Enumerable
	{
	
		public var optionIndex:uint;
		
		public function ScaleType(OptionIndex:int)
		{
			this.optionIndex = OptionIndex;
		}
		
		public static function formatDescription(desc:String):String
		{
			return desc.substr(0, 3).toLowerCase();
		}
		
		{Utils.InitEnumConstants(ScaleType); }
		
		public static const Major	:ScaleType = new ScaleType(0);
		public static const Minor	:ScaleType = new ScaleType(1);
		
		public static function getOptions():Vector.<ScaleType>
		{
			var result:Vector.<ScaleType> = new Vector.<ScaleType>();
			result.push(Major, Minor);
			return result;
		}
				
	}

}