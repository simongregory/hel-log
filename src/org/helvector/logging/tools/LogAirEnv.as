//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package org.helvector.logging.tools
{

import flash.desktop.NativeApplication;
import flash.display.NativeWindow;
import flash.system.Capabilities;

/**
 * @inheritDoc
 *
 * Additionally adds properties only available when compiled to an AIR
 * application.
 *
 * @langversion ActionScript 3
 * @playerversion Flash 9.0.0
 * @playerversion AIR
 *
 * @author Simon Gregory
 * @since  15.06.2010
 */
public class LogAirEnv extends LogEnv
{

    /**
     * @constructor
     */
	public function LogAirEnv()
	{
		super();
	}

    /**
     * @inheritDoc
     *
     * Adds AIR specific capabilites.
     */
	override protected function capabilites():void
	{
        super.capabilites();

		add("CPU Architecture",		         Capabilities.cpuArchitecture);
		add("Supports 32 Bit Processes",	 Capabilities.supports32BitProcesses);
		add("Supports 64 Bit Processes",	 Capabilities.supports64BitProcesses);
		add("Max H.264 Level IDC supported", Capabilities.maxLevelIDC);

		add("Supports Dock Icon",             NativeApplication.supportsDockIcon);
        add("Supports Application Menu",      NativeApplication.supportsMenu);
        add("Supports System Tray Icon",      NativeApplication.supportsSystemTrayIcon);
        add("Supports Window Menu",           NativeWindow.supportsMenu);
        add("Supports Supports Transparency", NativeWindow.supportsTransparency);
	}

}

}