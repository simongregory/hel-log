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
	function set filter(value:String):void;
	function get filter():String;
	
	function log(message:String, ...rest):void;

	//function logLevel(level:uint, message:String, ...rest):void;

	function add(target:ILoggerTarget):void;

	function debug(message:String, ...rest):void;

	function info(message:String, ...rest):void;

	function warn(message:String, ...rest):void;

	function error(message:String, ...rest):void;

	function fatal(message:String, ...rest):void;

	function env():void;
}

}
