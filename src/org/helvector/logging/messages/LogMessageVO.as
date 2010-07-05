//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package org.helvector.logging.messages
{

public class LogMessageVO
{

	/**
	 * The log message.
	 */
	public var message:String;

	/**
	 * The fully qualified class and method name from which the logging call
	 * was invoked.
	 */
	public var source:String;

	/**
	 * Date object describing the time that the log message was created.
	 */
	public var date:Date;

	/**
	 * The log level.
	 */
	public var level:int;

	/**
	 * @private
	 */
	public var filter:String;

}

}