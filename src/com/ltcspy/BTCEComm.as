package com.ltcspy
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.HTTPStatusEvent;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLRequest;

	public class BTCEComm extends EventDispatcher
	{
		public static const instance:BTCEComm = new BTCEComm();
		public function BTCEComm()
		{
		}
		
		private var urlLoader:BTCEUrlLoader;
		
		public function getTradesUSD():void
		{
			callServer("https://btc-e.com/api/2/ltc_usd/trades", BTCEUrlLoader.HISTORY_RECEIVED);
		}
		
		public function getTickerUSD():void
		{
			callServer("https://btc-e.com/api/2/ltc_usd/ticker", BTCEUrlLoader.TICKER_RECEIVED);
		}
		
		public function getDepthUSD():void
		{
			callServer("https://btc-e.com/api/2/ltc_usd/depth", BTCEUrlLoader.DEPTH_RECEIVED);
		}
		
		public function getTradesLTCBTC():void
		{
			callServer("https://btc-e.com/api/2/ltc_btc/trades", BTCEUrlLoader.HISTORY_RECEIVED);
		}
		
		public function getTickerLTCBTC():void
		{
			callServer("https://btc-e.com/api/2/ltc_btc/ticker", BTCEUrlLoader.TICKER_RECEIVED);
		}
		
		public function getDepthLTCBTC():void
		{
			callServer("https://btc-e.com/api/2/ltc_btc/depth", BTCEUrlLoader.DEPTH_RECEIVED);
		}
		
		
		public function callServer(url:String, type:String):void
		{
			urlLoader = new BTCEUrlLoader(type);
		
			configureListeners(urlLoader);
			
			var request:URLRequest = new URLRequest(url);
			try {
				urlLoader.load(request);
			} catch (error:Error) {
				trace("Unable to load requested document.");
			}
		}
		
		private function configureListeners(dispatcher:IEventDispatcher):void {
			dispatcher.addEventListener(Event.COMPLETE, completeHandler);
			dispatcher.addEventListener(Event.OPEN, openHandler);
			dispatcher.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			dispatcher.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			dispatcher.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
			dispatcher.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
		}
		
		private function completeHandler(event:Event):void {
			var loader:BTCEUrlLoader = BTCEUrlLoader(event.target);
			switch(loader.requestType)
			{
				case BTCEUrlLoader.DEPTH_RECEIVED:
					dispatchEvent(new DepthLoadedEvent(JSON.parse(loader.data)));
				break;
				case BTCEUrlLoader.HISTORY_RECEIVED:
					dispatchEvent(new HistoryLoadedEvent(JSON.parse(loader.data)));
				break;
				case BTCEUrlLoader.TICKER_RECEIVED:
					dispatchEvent(new TickerLoadedEvent(JSON.parse(loader.data)));
				break;
			}
		}
		
		private function openHandler(event:Event):void {
			//trace("openHandler: " + event);
		}
		
		private function progressHandler(event:ProgressEvent):void {
			//trace("progressHandler loaded:" + event.bytesLoaded + " total: " + event.bytesTotal);
		}
		
		private function securityErrorHandler(event:SecurityErrorEvent):void {
			trace("securityErrorHandler: " + event);
		}
		
		private function httpStatusHandler(event:HTTPStatusEvent):void {
			//trace("httpStatusHandler: " + event);
		}
		
		private function ioErrorHandler(event:IOErrorEvent):void {
			trace("ioErrorHandler: " + event);
		}
	}
}