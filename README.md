This is a simple library for allowing connections the public BTCE Api.  Currently only supports litecoins but Bitcoin would be easy to add. 

Here is an example to get started:

Just add the SWC file to your project (or the code) and use as shown in the example below.

I decided to make BTCEComm a singleton to make it easy to use, but you can instantiate it if you want too.

The private API methods coming soon

package
{
	import com.ltcspy.BTCEComm;
	import com.ltcspy.DepthLoadedEvent;
	import com.ltcspy.HistoryLoadedEvent;
	import com.ltcspy.TickerLoadedEvent;
	import com.ltcspy.vo.DepthVO;
	import com.ltcspy.vo.TickerVO;
	import com.ltcspy.vo.TradeHistoryVO;

	public class Example
	{
		public function Example()
		{
			
			BTCEComm.instance.addEventListener(DepthLoadedEvent.NAME, depthLoaded);
			BTCEComm.instance.addEventListener(HistoryLoadedEvent.NAME, historyLoaded);
			BTCEComm.instance.addEventListener(TickerLoadedEvent.NAME, tickerLoaded);
			BTCEComm.instance.getDepthUSD();
		}
		
		protected function tickerLoaded(event:TickerLoadedEvent):void
		{
			//Event Payload is a TickerVO
			trace("TICKER LOADED");
			var payload:TickerVO = event.payload;
		}
		
		protected function historyLoaded(event:HistoryLoadedEvent):void
		{
			//Event Payload is a TradeHistoryVO
			var payload:TradeHistoryVO = event.payload;
			trace("HISTORY LOADED");
			//now you can use it
		}
		
		protected function depthLoaded(event:DepthLoadedEvent):void
		{
			//Event Payload is a DepthVO
			var payload:DepthVO = event.payload;
			trace("DEPTH LOADED");	
		}
	}
}
