package utils  
{
	import flash.utils.describeType;
	import org.flixel.FlxBasic;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
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
		
		public static function UpdateAlpha(spriteOrGroup:FlxBasic, alpha:Number):void
		{
			if (spriteOrGroup == null)
			{
				return;
			}
			if (spriteOrGroup is FlxSprite)
			{
				(spriteOrGroup as FlxSprite).alpha = alpha;
			}
			else if (spriteOrGroup is FlxGroup)
			{
				var group:FlxGroup = spriteOrGroup as FlxGroup;
				for each (var item:FlxBasic in group.members)
				{
					UpdateAlpha(item, alpha);
				}
			}
			return;
		}
		
	}

}