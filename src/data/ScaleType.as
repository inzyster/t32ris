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
		
		{Utils.InitEnumConstants(ScaleType); }
		
		public static const Major	:ScaleType = new ScaleType();
		public static const Minor	:ScaleType = new ScaleType();
		
	}

}