using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DllExport;
using System.Runtime.InteropServices;

namespace Enemy_creation_ext
{

    public class Class1
    {
        [DllExport("EnemySelection", CallingConvention.Cdecl)]
        public static string EnemySelection()
        {
            return "hi";
        }
    }
}
