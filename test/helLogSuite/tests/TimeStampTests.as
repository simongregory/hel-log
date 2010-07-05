//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package helLogSuite.tests
{

import org.flexunit.Assert;

import org.helvector.logging.util.TimeStamp;

public class TimeStampTests
{
	private function get zeroHour():Date
	{
		return new Date(0);
	}

	private function get beforeZero():Date
	{
		return new Date(-14189025000); // 20/07/1969 18:36:15.000
	}

	private function get afterZero():Date
	{
		return new Date(628485293000); // 01/12/1989 03:14:53.000
	}

	[Test]
	public function dateAndTime():void
	{
		var time:TimeStamp = new TimeStamp();

		Assert.assertEquals("01/01/1970 00:00:00.000",time.stamp(zeroHour));
		Assert.assertEquals("01/12/1989 03:14:53.000",time.stamp(afterZero));
		Assert.assertEquals("20/07/1969 18:36:15.000",time.stamp(beforeZero));
	}

	[Test]
	public function empty():void
	{
		var time:TimeStamp = new TimeStamp(false,false);

		Assert.assertEquals("",time.stamp(zeroHour));
		Assert.assertEquals("",time.stamp(afterZero));
		Assert.assertEquals("",time.stamp(beforeZero));
	}

	[Test]
	public function dateOnly():void
	{
		var time:TimeStamp = new TimeStamp(true,false);

		Assert.assertEquals("01/01/1970",time.stamp(zeroHour));
		Assert.assertEquals("01/12/1989",time.stamp(afterZero));
		Assert.assertEquals("20/07/1969",time.stamp(beforeZero));
	}

	[Test]
	public function timeOnly():void
	{
		var time:TimeStamp = new TimeStamp(false);

		Assert.assertEquals("00:00:00.000",time.stamp(zeroHour));
		Assert.assertEquals("03:14:53.000",time.stamp(afterZero));
		Assert.assertEquals("18:36:15.000",time.stamp(beforeZero));
	}

}

}