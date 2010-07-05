//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package org.helvector.logging
{

/**
 * Contract for objects which can log messages to output streams.
 */
public interface ILogger
{

	function log(message:String,rest:Array=null):void;

	function logLevel(level:uint,message:String,rest:Array=null):void;

	function add(target:ILoggerTarget):void;

}

}
