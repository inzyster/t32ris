package utils  
{
	import flash.utils.describeType;
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class Utils 
	{
		
		public static function InitEnumConstants(enumType:*):void
		{
			var type:XML = describeType(enumType);
			for each (var constant:XML in type.constant)
			{
				enumType[constant.@name].description = constant.@name;
			}
		}
		
	}

}