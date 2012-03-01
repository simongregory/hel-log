//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package org.helvector.logging
{

/**
 * Dictionary class matches uints within the range 0 to 5 to corresponding
 * localised debug strings. These strings are expected to form the first
 * characters output in the log message have a normalised length. Any number
 * supplied outside of the 0 to 5 range will be clamped to be within it.
 *
 * This includes the conventional ALL, INFO, WARN, DEBUG, ERROR and FATAL. It is
 * possible to introduce extra levels simply by extending this class. Which is
 * also recommended if you wish to quickly localise.
 *
 * @langversion ActionScript 3
 * @playerversion Flash 9.0.0
 *
 * @author Simon Gregory
 */
public class HelLogLevel
{

    public static const ALL:uint   = 0;
    public static const DEBUG:uint = 1;
    public static const INFO:uint  = 2;
    public static const WARN:uint  = 3;
    public static const ERROR:uint = 4;
    public static const FATAL:uint = 5;

    public function HelLogLevel()
    {
        super();
        init();
    }

    private var _levels:Array;

    public function describe(level:uint):String
    {
        if (level < 0 ) level = 0;
        if (level > 5 ) level = 5;
        return _levels[level];
    }

    public function lookup(description:String):uint
    {
        var result:uint = 0;

		if (description == null) return result;

        switch (description.toUpperCase())
        {
        case "DEBUG":
            result = 1;
            break;
        case "INFO":
            result = 2;
            break;
        case "WARN":
            result = 3;
            break;
        case "ERROR":
            result = 4;
            break;
        case "FATAL":
            result = 5;
            break;
        }

        return result;
    }

    protected function init():void
    {
        _levels = [
            "[ALL]   ",
            "[DEBUG] ",
            "[INFO]  ",
            "[WARN]  ",
            "[ERROR] ",
            "[FATAL] "
        ];
    }

}
}
