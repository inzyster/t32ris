package display 
{
	import utils.Enumerable;
	import utils.Utils;
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class Color extends Enumerable
	{

		private var _argbValue:uint;
		
		public function get ARGBValue():uint
		{
			return _argbValue;
		}
		
		public function get RGBValue():uint
		{
			return _argbValue & 0x00ffffff;
		}
		
		{Utils.InitEnumConstants(Color);}
		public function Color(argbValue:uint)
		{
			_argbValue = argbValue;
		}
		
		public static const Black		:Color = new Color(0xff000000);
		public static const Blue		:Color = new Color(0xff0000aa);
		public static const Green		:Color = new Color(0xff00aa00);
		public static const Cyan		:Color = new Color(0xff00aaaa);
		public static const Red			:Color = new Color(0xffaa0000);
		public static const Magenta		:Color = new Color(0xffaa00aa);
		public static const Brown		:Color = new Color(0xffaa5500);
		public static const LightGray	:Color = new Color(0xffaaaaaa);
		public static const Gray		:Color = new Color(0xff555555);
		public static const LightBlue	:Color = new Color(0xff5555ff);
		public static const LightGreen	:Color = new Color(0xff55ff55);
		public static const LightCyan	:Color = new Color(0xff55ffff);
		public static const LightRed	:Color = new Color(0xffff5555);
		public static const LightMagenta:Color = new Color(0xffff55ff);
		public static const Yellow		:Color = new Color(0xffffff55);
		public static const White		:Color = new Color(0xffffffff);
		
	}

}