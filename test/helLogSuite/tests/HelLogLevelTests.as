//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package helLogSuite.tests
{

import flash.system.Capabilities;

import org.flexunit.Assert;

import org.helvector.logging.HelLogLevel;

public class HelLogLevelTests
{

	[Test]
	public function all():void
	{
        var lev:HelLogLevel = new HelLogLevel();
        var str:String = lev.describe(0);

        Assert.assertNotNull(str);
        Assert.assertEquals("[ALL]   ",str);
	}

	[Test]
	public function debug():void
	{
        var lev:HelLogLevel = new HelLogLevel();
        var str:String = lev.describe(1);

        Assert.assertNotNull(str);
        Assert.assertEquals("[DEBUG] ",str);
	}

	[Test]
	public function info():void
	{
        var lev:HelLogLevel = new HelLogLevel();
        var str:String = lev.describe(2);

        Assert.assertNotNull(str);
        Assert.assertEquals("[INFO]  ",str);
	}

	[Test]
	public function warn():void
	{
        var lev:HelLogLevel = new HelLogLevel();
        var str:String = lev.describe(3);

        Assert.assertNotNull(str);
        Assert.assertEquals("[WARN]  ",str);
	}

	[Test]
	public function error():void
	{
        var lev:HelLogLevel = new HelLogLevel();
        var str:String = lev.describe(4);

        Assert.assertNotNull(str);
        Assert.assertEquals("[ERROR] ",str);
	}

	[Test]
	public function fatal():void
	{
        var lev:HelLogLevel = new HelLogLevel();
        var str:String = lev.describe(5);

        Assert.assertNotNull(str);
        Assert.assertEquals("[FATAL] ",str);
	}
}

}