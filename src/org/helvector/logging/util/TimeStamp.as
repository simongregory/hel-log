//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package org.helvector.logging.util
{

/**
 * Date string fomatter for use when logging.
 * 
 * <p>For readability strings are output to a consistent length. Date only, time
 * only, or date and time can be specified to output. Dates are formatted using 
 * British convention of Day/Month/Year.</p>
 */
public class TimeStamp
{
	
	/**
	 * @param dated Flag to set output to include the date.
	 * @param timed Flag to set output to include the time.
	 */
	public function TimeStamp(dated:Boolean=true,timed:Boolean=true)
	{
		super();
		_dated = dated;
		_timed = timed;
	}

	/**
	 * String to use when seperating logical portions of the string.
	 */
	protected var _separator:String = " ";

	/**
	 * Flag specifiying if the data should be included in the formatted string.
	 */
	protected var _dated:Boolean;

	/**
	 * Flag specifiying if hours,minutes,seconds and milliseconds should be
	 * included in the formatted string.
	 */
	protected var _timed:Boolean;

	/**
	 * Create and return the time stamp. This will be in the format 
	 * <code>21/01/1970 00:00:00.000</code>, <code>00:00:00.000</code>,
	 * <code>21/01/1970</code> or an empty string.
	 */
	public function stamp(date:Date=null):String
	{
		var out:String = "";
		var dateSep:String = "/";
		var timeSep:String = ":";
		var now:Date = (date) ? date : new Date();

        if (_dated)
        {
            out = pad(now.getDate()) + dateSep +
				  pad(now.getMonth() + 1) + dateSep +
                  now.getFullYear();
        }

		if (_dated && _timed)
			out += _separator;

        if (_timed)
        {
            out += pad(now.getHours()) + timeSep +
                   pad(now.getMinutes()) + timeSep +
                   pad(now.getSeconds()) + "." +
                   padMilliseconds(now.getMilliseconds());
        }

		return out;
	}

	protected function pad(num:Number):String
	{
		return num > 9 ? num.toString() : "0" + num.toString();
	}

	protected function padMilliseconds(num:Number):String
    {
	    if (num < 10) return "00" + num.toString();
		if (num < 100) return "0" + num.toString();

		return num.toString();
    }

}

}