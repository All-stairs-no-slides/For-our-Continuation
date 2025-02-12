using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DllExport;
using System.Runtime.InteropServices;
using Microsoft.ML;
using Microsoft.ML.Data;
using System.IO;

namespace Enemy_creation_ext
{

    public class ML_model
    {
        [LoadColumn(0)]
        public string Body { get; set; }

        [LoadColumn(1)]
        public string Legs { get; set; }

        [LoadColumn(2)]
        public string Used_Gun { get; set; }

        [LoadColumn(3)]
        [ColumnName("Label")]
        public string Distance { get; set; }


        [DllExport("EnemySelection", CallingConvention.Cdecl)]
        public static string EnemySelection(string Data_File_Path)
        {

            // Load the data
            Console.WriteLine(File.Exists(Data_File_Path));
            MLContext mlContext = new MLContext();
            IDataView data = mlContext.Data.LoadFromTextFile<ML_model>(Data_File_Path, separatorChar: ',', hasHeader: true);

            return "volly";

        }
    }
}
