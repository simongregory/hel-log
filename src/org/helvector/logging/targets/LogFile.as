//AS3///////////////////////////////////////////////////////////////////////////
//
// Copyright 2010 the original author or authors.
//
////////////////////////////////////////////////////////////////////////////////

package org.helvector.logging.targets
{
import org.helvector.logging.ILoggerTarget;

import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

/**
 * Simple log target that traces output to the flashlog.txt file.
 */
public class LogFile implements ILoggerTarget
{
    private static const NEW_LINE:String = '\n';
    
    public function LogFile(file:File=null)
    {
        super();
        init(file);
    }
    
    private var target:File;
    private var stream:FileStream;
    
    private function init(file:File=null):void
    {
        target = (file == null) ? File.applicationStorageDirectory.resolvePath('app.log') : file;
        if (target.exists) target.deleteFile();
        stream = new FileStream();
    }

    public function write(message:String):void
    {
        stream.open(target, FileMode.APPEND);
        stream.writeMultiByte(message + NEW_LINE, 'utf-8');
        stream.close();
    }
}
}
