package com.ltcspy
{
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	public class BTCEUrlLoader extends URLLoader
	{
		public static const DEPTH_RECEIVED:String = "DEPTHRECEIVED";
		public static const TICKER_RECEIVED:String = "TICKERRECEIVED";
		public static const HISTORY_RECEIVED:String = "HISTORYRECEIVED";
		
		public var requestType:String = "";
		public function BTCEUrlLoader(type:String)
		{
			super();
			requestType = type;
		}
	}
}