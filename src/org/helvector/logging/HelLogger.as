//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package org.helvector.logging
{

import flash.system.Capabilities;

import org.helvector.logging.util.ISubstitutor;
import org.helvector.logging.util.MessageSubstitutor;

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
	public function log(message:String, rest:Array=null):void
	{
		if (rest == null) rest = [];
		write('',message,rest);
	}

    /**
     * Log the requested message at the level specified, substituting any string
     * placeholders, to all the current logging targets.
     */
	public function logLevel(level:uint, message:String, rest:Array=null):void
	{
	   	if (rest == null) rest = [];

		write(_logLevel.describe(level),
		      message,
		      rest);
	}

	/**
	 * Write the log message to all targets.
	 */
	protected function write(level:String, message:String, rest:Array):void
	{
		var msg:String = level + reflect();
		msg += _substitutor.run(message,rest);

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

		var regex:RegExp = /^\s+at\s(.+)\/(.*)\(\)/i;
		var match:Array = regex.exec(item);

		var clas:String = match[1];
		var meth:String = match[2];

		var origin:String = clas + '/' + meth + '() ';

		return origin;
	}

}

}