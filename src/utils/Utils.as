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
		
		public static function GetAlphaInt(alpha:Number):uint
		{
			return ((alpha * 255.0) as uint);
		}
		
		public static function BlendRGB(from:uint, to:uint, ratio:Number):uint
		{
			var r:uint = Math.round((from & 0xff0000 >> 16) * (1.0 - ratio) + (to & 0xff0000 >> 16) * ratio);
			var g:uint = Math.round((from & 0x00ff00 >> 8) * (1.0 - ratio) + (to & 0x00ff00 >> 8) * ratio);
			var b:uint = Math.round((from & 0x0000ff) * (1.0 - ratio) + (to & 0x0000ff) * ratio);
			return (r << 16 | g << 8 | b);
		}
		
	}

}