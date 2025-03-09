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
    public class Gun_Data 
    {
        [LoadColumn(0)]
        [ColumnName("Feature1")]
        public string Body { get; set; }

        [LoadColumn(1)]
        [ColumnName("Feature2")]
        public string Legs { get; set; }

        [LoadColumn(2)]
        [ColumnName("Feature3")]
        public string Used_Gun { get; set; }

        [LoadColumn(3)]
        [ColumnName("Label")]
        public float Distance { get; set; }
    }

    public class Predicted_closeness
    {
        [ColumnName("Score")]
        public float Predicted_Distance { get; set; }

    }

    public class ML_model
    {

        [DllExport("EnemySelection", CallingConvention.Cdecl)]
        public static string EnemySelection(string Data_File_Path)
        {

            //Load the data
            Console.WriteLine(File.Exists(Data_File_Path));
            MLContext mlContext = new MLContext();
            IDataView data = mlContext.Data.LoadFromTextFile<Gun_Data>(Data_File_Path, separatorChar: ',', hasHeader: true);

            // create the pipeline
            var pipeline = mlContext.Transforms.Text.FeaturizeText("Feature1_Features", "Feature1")
            .Append(mlContext.Transforms.Text.FeaturizeText("Feature2_Features", "Feature2"))
            .Append(mlContext.Transforms.Text.FeaturizeText("Feature3_Features", "Feature3"))
            .Append(mlContext.Transforms.Concatenate("Features", "Feature1_Features", "Feature2_Features", "Feature3_Features"))
            .Append(mlContext.Regression.Trainers.FastForest());

            ITransformer model = pipeline.Fit(data);

            // the predictions
            PredictionEngine<Gun_Data, Predicted_closeness> PredictionEng = mlContext.Model.CreatePredictionEngine<Gun_Data, Predicted_closeness>(model);


            Gun_Data[] input_data = new Gun_Data[]
            {
                
                new Gun_Data
                {
                    Body = @"enemy_body_1_spr",
                    Legs = @"enemy_base_1_spr",
                    Used_Gun = @"pea_bul_spr",
                },
                new Gun_Data
                {
                    Body = @"enemy_body_1_spr",
                    Legs = @"enemy_base_1_spr",
                    Used_Gun = @"gat_bul_spr",
                },
                new Gun_Data
                {
                    Body = @"enemy_body_1_spr",
                    Legs = @"enemy_base_1_spr",
                    Used_Gun = @"spray_bul_spr",
                }
            };


            IEnumerable<Predicted_closeness> prediction = input_data.Select(input => PredictionEng.Predict(input));
            List<Predicted_closeness> pred = prediction.ToList();
            float total = 0f;
            string final_weights = "";

            total += pred[0].Predicted_Distance;
            total += pred[1].Predicted_Distance;
            total += pred[2].Predicted_Distance;



            final_weights += (pred[0].Predicted_Distance / total).ToString();

            final_weights += "$$" + (pred[1].Predicted_Distance / total).ToString();

            final_weights += "$$" + (pred[2].Predicted_Distance / total).ToString();

            return final_weights;


            //Load sample data
            //var sampleData = new MLModel1.ModelInput()
            //{
            //    Body = @"enemy_body_1_spr",
            //    Legs = @"enemy_base_1_spr",
            //    Used_Gun = @"spray_bul_spr",
            //};

            ////Load model and predict output
            //var result = MLModel1.Predict(sampleData);

            //return result.Score.ToString();

        }
    }
}
