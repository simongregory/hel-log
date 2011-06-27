//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package helLogSuite.tests
{

import org.flexunit.Assert;
import org.helvector.logging.util.StackTraceFormatter;

public class StackTraceFormatterTest
{
    [Before]
    public function setUp():void
    {
        _formatter = new StackTraceFormatter();
    }

    private var _formatter:StackTraceFormatter;

    [Test(expects="TypeError")]
    public function invalidString():void
    {
        //Example string found in the ASDocs for Error, but the players I'm
        //testing with don't output in this format.
        _formatter.line(' at com.xyz.OrderEntry.retrieveData(OrderEntry.as:995)')
    }

    [Test(expects='TypeError')]
    public function firstLineOfStackTrace():void
    {
        _formatter.line('TypeError: Error #1009: Cannot access a property or method of a null object reference.');
    }

    [Test]
    public function verboseTopLevel():void
    {
        var verbose:String = ' at GalleryFactory()[/Users/simon/src/helvector/gallery/src/GalleryFactory.as:70]';
        var formatted:String = _formatter.line(verbose);

        Assert.assertEquals('GalleryFactory/GalleryFactory()',formatted);
    }

    [Test]
    public function verboseGlobalLevel():void
    {
        var global:String = '   at global/log()[/Users/simon/src/helvector/hel-log/src/log.as:13]'
        var formatted:String = _formatter.line(global);

        Assert.assertEquals('global/log()',formatted);
    }

    [Test]
    public function verbosePackgeLevel():void
    {
        var verbose:String = '	at org.helvector.logging::HelLogger/write()[/Users/simon/src/helvector/hel-log/src/org/helvector/logging/HelLogger.as:84]';
        var formatted:String = _formatter.line(verbose);

        Assert.assertEquals('org.helvector.logging::HelLogger/write()',formatted);
    }

}

}
