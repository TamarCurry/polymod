/**
 * Copyright (c) 2018 Level Up Labs, LLC
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 * 
 */

package polymod.fs;

class PolymodFileSystem
{
    public static inline function exists( path: String )
    {
        #if nodefs
            return NodeFileSystem.exists(path);
        #elseif sys
            return SysFileSystem.exists(path);
        #else
            return StubFileSystem.exists(path);
        #end
    }

    public static inline function isDirectory( path: String )
    {
        #if nodefs
            return NodeFileSystem.isDirectory(path);
        #elseif sys
            return SysFileSystem.isDirectory(path);
        #else
            return StubFileSystem.isDirectory(path);
        #end
    }

    public static inline function readDirectory( path: String ) : Array<String>
    {
        #if nodefs
            return NodeFileSystem.readDirectory(path);
        #elseif sys
            return SysFileSystem.readDirectory(path);
        #else
            return StubFileSystem.readDirectory(path);
        #end
    }

    public static inline function getFileContent( path: String )
    {
        if (!exists(path)) {
            return null;
        }
		
        #if nodefs
            return NodeFileSystem.getFileContent(path);
        #elseif sys
            return SysFileSystem.getFileContent(path);
        #else
            return StubFileSystem.getFileContent(path);
        #end
    }

    public static inline function getFileBytes( path: String )
    {
        if (!exists(path)) {
            return null;
        }
		
        #if nodefs
            return NodeFileSystem.getFileBytes(path);
        #elseif sys
            return SysFileSystem.getFileBytes(path);
        #else
            return StubFileSystem.getFileBytes(path);
        #end
    }

    public static inline function readDirectoryRecursive( path: String )
    {
        #if nodefs
            return NodeFileSystem.readDirectoryRecursive(path);
        #elseif sys
            return SysFileSystem.readDirectoryRecursive(path);
        #else
            return StubFileSystem.readDirectoryRecursive(path);
        #end
    }
}
