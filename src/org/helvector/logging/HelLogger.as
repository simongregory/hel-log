//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package org.helvector.logging
{
import flash.system.Capabilities;

import org.helvector.logging.tools.ILogEnv;
import org.helvector.logging.tools.LogAirEnv;
import org.helvector.logging.util.ISubstitutor;
import org.helvector.logging.util.MessageSubstitutor;
import org.helvector.logging.util.StackTraceFormatter;
import org.helvector.logging.util.TimeStamp;

public class HelLogger implements ILogger
{

	public function HelLogger(stackIndex:int=5)
	{
		super();
		_stackIndex = stackIndex;
		_substitutor = new MessageSubstitutor();
		_logLevel = new HelLogLevel();
	}

	private var _targets:Array = [];
	private var _stackIndex:int;
	private var _substitutor:ISubstitutor;
	private var _logLevel:HelLogLevel;
	private var _filterLevel:uint = 0;

	/**
	 * Set log level filter to control amount of output.
	 */
	public function set filter(value:String):void
	{
		_filterLevel = _logLevel.lookup(value);
	}
	
	public function get filter():String
	{
		return _logLevel.describe(_filterLevel);
	}
	
	/**
	 * Add a log target. A place to which to send log messages - file, server.
	 */
	public function add(target:ILoggerTarget):void
	{
		if (_targets.indexOf(target) == -1) _targets.push(target);
	}

	/**
	 * Remove a log target.
	 */
	public function remove(target:ILoggerTarget):void
	{
		var pos:int = _targets.indexOf(target);
		if (pos > -1) _targets.splice(pos,1);
	}

	/**
	 * Write env info to all log targets.
	 */
	public function env():void
	{
	    var env:ILogEnv = new LogAirEnv(this);
        info(env.description);
	}

	/**
	 * Removes all logging targets.
	 */
	public function clear():void
	{
		_targets = [];
	}

	/**
	 * Log the requested message, substituting any string place holders, to all
	 * the current logging targets.
	 */
	public function log(message:String, ...rest):void
	{
		if (rest == null) rest = [];
		write('',message,rest);
	}

    public function debug(message:String, ...rest):void
	{
		logLevel(HelLogLevel.DEBUG,message,rest);
	}

    public function info(message:String, ...rest):void
	{
		logLevel(HelLogLevel.INFO,message,rest);
	}

    public function warn(message:String, ...rest):void
	{
		logLevel(HelLogLevel.WARN,message,rest);
	}

    public function error(message:String, ...rest):void
	{
		logLevel(HelLogLevel.ERROR,message,rest);
	}

    public function fatal(message:String, ...rest):void
	{
		logLevel(HelLogLevel.FATAL,message,rest);
	}

    /**
     * Log the requested message at the level specified, substituting any string
     * placeholders, to all the current logging targets.
     */
	private function logLevel(level:uint, message:String, values:Array):void
	{
	   	//if (rest == null) rest = [];

		if (level >= _filterLevel)
			write(_logLevel.describe(level), message, values);
	}

    private var time:TimeStamp = new TimeStamp;

	/**
	 * Write the log message to all targets.
	 */
	protected function write(level:String, message:String, values:Array):void
	{
		var msg:String = '[' + time.stamp() + '] ' + level + reflect();
		msg += _substitutor.run(message,values);

		for each (var target:ILoggerTarget in _targets) target.write(msg);
	}

	/**
	 * Work out where the log call orginated from using a stack trace and return
	 * a string in the format of:
	 *
	 * <code>org.helvector.logging::HelLogger/reflect()</code>.
	 *
	 * <p>This only works if we are running within the debugger environment.<p>
	 */
    protected function reflect():String
	{
		if (!Capabilities.isDebugger) return '';

		var stack:Array = new Error().getStackTrace().split('\n');
		var item:String = stack[_stackIndex];
		var formatter:StackTraceFormatter = new StackTraceFormatter();

		return formatter.line(item) + ' ';
	}

}

}
