package data 
{
	import utils.Enumerable;
	import utils.Utils;
	/**
	 * ...
	 * @author Wrong Tomato Factory
	 */
	public class ScaleKey extends Enumerable
	{
		
		{Utils.InitEnumConstants(ScaleKey);}
		
		public static const C		:ScaleKey = new ScaleKey();
		public static const Db		:ScaleKey = new ScaleKey();
		public static const D		:ScaleKey = new ScaleKey();
		public static const Eb		:ScaleKey = new ScaleKey();
		public static const E		:ScaleKey = new ScaleKey();
		public static const F		:ScaleKey = new ScaleKey();
		public static const Gb		:ScaleKey = new ScaleKey();
		public static const G		:ScaleKey = new ScaleKey();
		public static const Ab		:ScaleKey = new ScaleKey();
		public static const A		:ScaleKey = new ScaleKey();
		public static const Bb		:ScaleKey = new ScaleKey();
		public static const B		:ScaleKey = new ScaleKey();
		
		public static const CSharp	:ScaleKey = Db;
		public static const DSharp	:ScaleKey = Eb;
		public static const FSharp	:ScaleKey = Gb;
		public static const GSharp	:ScaleKey = Ab;
		public static const ASharp	:ScaleKey = Bb;
		
	}

}