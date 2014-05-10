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
				if (enumType[constant.@name].description == null)
				{
					if (enumType.formatDescription != null)
					{
						enumType[constant.@name].description = enumType.formatDescription(constant.@name);
					}
					else 
					{
						enumType[constant.@name].description = constant.@name;
					}
				}
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
		
		public static function WrapInt(value:int, min:int, max:int):int
		{
			var range:int = max - min;
			if (range <= 0)
			{
				return 0;
			}
			var result:int = (value - min) % range;
			if (result < 0)
			{
				result += range;
			}
			return result + min;
		}
		
		public static function ClampInt(value:int, min:int, max:int):int
		{
			return (value < min ? min : (value > max ? max : value));
		}
		
		public static function InterpolateInt(from:int, to:int, weight:Number):int
		{
			return Math.round((to - from) * weight + from);
		}
		
		public static function InterpolateRGB(from:uint, to:uint, weight:Number):uint
		{
			var r:uint = InterpolateInt(((from & 0xff0000) >> 16), ((to & 0xff0000) >> 16), weight);
			var g:uint = InterpolateInt(((from & 0x00ff00) >> 8), ((to & 0x00ff00) >> 8), weight);
			var b:uint = InterpolateInt((from & 0x0000ff), (to & 0x0000ff), weight);
			return (r << 16 | g << 8 | b);
		}
		
	}

}