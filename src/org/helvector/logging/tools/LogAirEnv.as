//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2011 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package org.helvector.logging.tools
{
import flash.filesystem.File;

import org.helvector.logging.ILogger;

import flash.desktop.NativeApplication;
import flash.display.Screen;

public class LogAirEnv extends LogEnv
{
	public function LogAirEnv(logger:ILogger=null)
	{
		super(logger);
	}

    override protected function gather():void
    {
        super.gather();

        runtime();
        screens();
        directories();
        if (logger) logging();
    }

    override protected function system():void
    {
        super.system();
        //add("Application frame rate",     Application(Application.application).frameRate );
        //add("Script Timeout limit",       Application(Application.application).scriptTimeLimit );

        add("Supports Dock Icon",           NativeApplication.supportsDockIcon );
        add("Supports System Tray Icon",    NativeApplication.supportsSystemTrayIcon );
        add("Supports Menu",                NativeApplication.supportsMenu );

        try
        {
            add("App start at login",       NativeApplication.nativeApplication.startAtLogin);
        }
        catch (error:Error)
        {
            add("App start at login",       error.message);
        }
    }

    private function directories():void
    {
        add("DIRECTORIES");

        addDirectory('Application directory',         File.applicationDirectory);
        addDirectory('Application storage directory', File.applicationStorageDirectory);
        addDirectory("User directory",                File.userDirectory);
        addDirectory("Desktop directory",             File.desktopDirectory);
        addDirectory("Documents directory",           File.documentsDirectory);
        addDirectory("Cache directory",               File.cacheDirectory);

        const roots:Array = File.getRootDirectories();
        for each (var file:File in roots)
        {
            addDirectory("Root directory", file);
        }
    }

    private function addDirectory(description:String, folder:File):void
    {
        try
        {
            const path:String = folder.nativePath;
            const size:Number = folder.spaceAvailable;

            add(description, path + " (" + describeBytes(size) +" free)" );
        }
        catch (e:Error)
        {
            add(description, "Unknown");
        }
    }

    private function describeBytes(bytes:Number):String
    {
        var description:String = 'Folder size unknown';

        if (!isNaN(bytes))
        {
            const levels:Array = ['bytes', 'KB', 'MB', 'GB', 'TB', 'PB'];
            const index:uint = Math.floor(Math.log(bytes)/Math.log(1024));
            const value:String = (index < 2) ? Math.round(bytes/Math.pow(1024, index)).toString() : (bytes / Math.pow(1024, index)).toFixed(2);

            description = value + ' ' + levels[index];
        }

        return description;
    }

    public function runtime():void
    {
        add('AIR RUNTIME');

        add("AIR Runtime Patch Level", NativeApplication.nativeApplication.runtimePatchLevel);
        add("AIR Runtime Version",     NativeApplication.nativeApplication.runtimeVersion);
    }

    protected function screens():void
    {
        add("SCREENS");

        add("Number of screens", Screen.screens.length);

        for (var i:int = 0; i < Screen.screens.length; i++)
        {
            var screen:Screen = Screen.screens[i] as Screen;

            add( "SCREEN " + i.toString());
            add(" Color Depth", screen.colorDepth);
            add(" Visible Bounds", "l:"+screen.visibleBounds.left.toString()+" r:"+screen.visibleBounds.right.toString()+" t:"+screen.visibleBounds.top.toString()+" b:"+screen.visibleBounds.bottom.toString());
            add(" Bounds", "l:"+screen.bounds.left.toString()+" r:"+screen.bounds.right.toString()+" t:"+screen.bounds.top.toString()+" b:"+screen.bounds.bottom.toString());
        }
    }

    protected function logging():void
    {
        add("LOGGING");

        add("Level", logger.filter);
    }

}

}
