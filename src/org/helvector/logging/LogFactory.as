//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package org.helvector.logging
{

import org.helvector.logging.targets.Tracer;
import org.helvector.logging.targets.WebBrowser;
import org.helvector.logging.ILogger;

/**
 * Factory responsible for the creation of concreate ILogger instances.
 */
public class LogFactory
{
    public static const BASIC:String = "basic";
    public static const TRACE:String = "trace";

    private static var _logger:ILogger;

    public static function manufacture(type:String=BASIC):ILogger
    {
        if (_logger == null)
        {
            _logger = new LogFactory().manufacture(type);
        }

        return _logger;
    }

    public function manufacture(type:String):ILogger
    {
        var logger:ILogger;

        switch (type)
        {
            case BASIC :
                logger = createBasic();
            break;

            case TRACE :
                logger = createTracer();
            break;

            default :
                throw new Error("Unknown manufacture type specified: "+type);
            break;

        }

        return logger;
    }

    protected function createTracer():ILogger
    {
        var logger:ILogger = new HelLogger();
    	logger.add(new Tracer);

        return logger;
    }

    /**
     * Creates a HelLogger instance which will log to the
     * <code>flashlog.txt</code> file and <code>browser.console</code>.
     */
    protected function createBasic():ILogger
    {
    	var logger:ILogger = createTracer();
    	logger.add(new WebBrowser);

    	return logger;
    }

}

}