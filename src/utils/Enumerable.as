package utils 
{
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class Enumerable 
	{

		public var description:String;
		
		public static function formatDescription(desc:String):String
		{
			return desc;
		}
		
		public static function getOptions():Vector.<Enumerable>
		{
			return new Vector.<Enumerable>();
		}
		
	}

}