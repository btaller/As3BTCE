package com.ltcspy
{
	import com.ltcspy.vo.DepthVO;
	
	import flash.events.Event;

	public class DepthLoadedEvent extends Event
	{
		public static const NAME:String = "DEPTHRECEIVED";
		public var payload:DepthVO;
		public function DepthLoadedEvent(loadedData:Object)
		{
			payload = new DepthVO(loadedData);
			super(NAME);
		}
	}
}