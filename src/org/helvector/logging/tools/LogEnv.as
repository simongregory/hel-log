//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package org.helvector.logging.tools
{
	
import org.helvector.logging.ILogger;

import flash.system.System;
import flash.system.Capabilities;

/**
 * Inspects the current runtime, gathers all relevant information from the
 * <code>Capabilities</code> and <code>System</code> classes, and stores them
 * in the <code>description</code> property.
 *
 * <p>The <code>description</code> string will be generated when the class is
 * instantiated. To update it at a later time use <code>update()</code>.</p>
 */
public class LogEnv implements ILogEnv
{
	private var _logger:ILogger;

	public function LogEnv(logger:ILogger)
	{
		_logger = logger;
		
		super();
		gather();
        write();
	}
	
	public function get logger():ILogger
	{
		return _logger
	}

	protected var _description:String = '';

	public function get description():String
	{
	   return _description;
	}

	private var _items:Array;

	public function update():String
	{
		gather();
        write();
		return _description;
	}

	protected function gather():void
	{
		_items = [];

		capabilites();
		system();
	}

	protected function capabilites():void
	{
		add("CAPABILITIES");

		add("System OS",					 Capabilities.os);
		add("Manufacturer",					 Capabilities.manufacturer );
		add("Flash Runtime Version",		 Capabilities.version);
		add("Flash Runtime Type",			 Capabilities.playerType);
		add("Has Accessibility aids", 		 Capabilities.hasAccessibility);
		add("Has Audio Encoder", 			 Capabilities.hasAudioEncoder);
		add("Has Video Encoder", 			 Capabilities.hasVideoEncoder);
        add("Max H.264 Level IDC supported", Capabilities.maxLevelIDC );
		add("Has MP3 Decoder",	 			 Capabilities.hasMP3);
		add("Has Streaming audio",			 Capabilities.hasStreamingAudio);
		add("Has Streaming video",			 Capabilities.hasStreamingVideo);
		add("Has Printing", 				 Capabilities.hasPrinting);
		add("Has NetConnection SSL sockets", Capabilities.hasTLS);
		add("Running a debugger", 			 Capabilities.isDebugger);
		add("User has disk access", 		 Capabilities.localFileReadDisable);
		add("Default langauge",		 		 Capabilities.language);
	}

	protected function system():void
	{
		add('SYSTEM');

		add("Application memory in use",	 System.totalMemory);
		add("VM Version", 					 System.vmVersion);
	}

	protected function add(prefix:String, value:Object=null):void
	{
		_items.push(prefix,value);
	}

	protected function write():void
	{
		var longest:int = 0;

		for (var i:int = 0; i < _items.length; i+=2)
		{
			var len:int = String(_items[i]).length;
			if (len > longest) longest = len;
		}

		longest += 2;

		var prefix:String;
		var value:String;

		for (i = 0; i < _items.length; i+=2)
		{
			prefix = _items[i];
			value  = _items[i+1];

			if (value != null)
				_description += "  " + fixLength(prefix, longest) + ": " + value.toString() + "\n";
			else
				_description += "\n" + prefix + "\n";
		}
	}

	protected function fixLength(value:String,length:int):String
	{
		var diff:int = length - value.length;
		if (diff>0)
		{
			for (var i:int = 0; i <= diff; i++) value += " ";
		}

		return value;
	}

}

}