//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package helLogSuite.tests
{

import org.flexunit.Assert;

import org.helvector.logging.ILogger;
import org.helvector.logging.LogFactory;

public class LogFactoryTests
{

    protected function get logFactory():LogFactory
    {
        return new LogFactory();
    }

    [Test]
    public function testManufactureTracer():void
    {
        var logger:ILogger = logFactory.manufacture(LogFactory.TRACE);
        var isILogger:Boolean = (logger is ILogger);

        Assert.assertEquals(true,isILogger);
    }

    [Test]
    public function testManufactureBasic():void
    {
        var logger:ILogger = logFactory.manufacture(LogFactory.BASIC);
        var isILogger:Boolean = (logger is ILogger);

        Assert.assertEquals(true,isILogger);
    }

    [Test(expects="Error")]
    public function testManufactureNothing():void
    {
        logFactory.manufacture('');
    }

    [Test(expects="Error")]
    public function testManufactureUnknownType():void
    {
        logFactory.manufacture('aaa1111zzzz2222');
    }

}

}