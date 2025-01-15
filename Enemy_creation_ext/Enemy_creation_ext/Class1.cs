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
            Data_File_Path = @"C:\Users\main\AppData\Local\For_our_Continuation\data.csv";

            

            // Load the data
            //try
            //{
            //    Console.WriteLine(File.Exists(Data_File_Path));
            //    //MLContext mlContext = new MLContext();
            //    //TextLoader data = mlContext.Data.CreateTextLoader<ML_model>(separatorChar: ',', hasHeader: true);
            //} catch(Exception e)
            //{
            //    return "hoi";
            //}
            return Data_File_Path;
        }
    }
}
