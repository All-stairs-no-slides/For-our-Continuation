﻿// This file was auto-generated by ML.NET Model Builder.

using Microsoft.ML.Data;
using Microsoft.ML;
using System;
using System.Collections.Generic;
using System.Linq;
using Plotly.NET;
using Plotly.NET.LayoutObjects;

namespace Enemy_creation_ext
{
    public partial class MLModel1
    {
        /// <summary>
        /// Permutation feature importance (PFI) is a technique to determine the importance 
        /// of features in a trained machine learning model. PFI works by taking a labeled dataset, 
        /// choosing a feature, and permuting the values for that feature across all the examples, 
        /// so that each example now has a random value for the feature and the original values for all other features.
        /// The evaluation metric (e.g. R-squared) is then calculated for this modified dataset, 
        /// and the change in the evaluation metric from the original dataset is computed. 
        /// The larger the change in the evaluation metric, the more important the feature is to the model.
        /// 
        /// PFI typically takes a long time to compute, as the evaluation metric is calculated 
        /// many times to determine the importance of each feature. 
        /// 
        /// </summary>
        /// <param name="mlContext">The common context for all ML.NET operations.</param>
        /// <param name="trainData">IDataView used to evaluate the model.</param>
        /// <param name="model">Model to evaluate.</param>
        /// <param name="labelColumnName">Label column being predicted.</param>
        /// <returns>A list of each feature and its importance.</returns>
        public static List<Tuple<string, double>> CalculatePFI(MLContext mlContext, IDataView trainData, ITransformer model, string labelColumnName)
        {
            var preprocessedTrainData = model.Transform(trainData);

            var permutationFeatureImportance =
         mlContext.Regression
         .PermutationFeatureImportance(
                 model,
                 preprocessedTrainData,
                 labelColumnName: labelColumnName);

            var featureImportanceMetrics =
                 permutationFeatureImportance
                 .Select((kvp) => new { kvp.Key, kvp.Value.RSquared })
                 .OrderByDescending(myFeatures => Math.Abs(myFeatures.RSquared.Mean));

            var featurePFI = new List<Tuple<string, double>>();
            foreach (var feature in featureImportanceMetrics)
            {
                var pfiValue = Math.Abs(feature.RSquared.Mean);
                featurePFI.Add(new Tuple<string, double>(feature.Key, pfiValue));
            }

            return featurePFI;
        }

        /// <summary>
        /// R Squared is a measure of variation between the values predicted by the model and the true values. 
        /// In a "perfect" model, there would be no variation between predictions and true values. 
        /// 
        /// Here we will plot the predicted values vs the true values for the trained model. This RegressionChart.html 
        /// is then saved to the location specified by <param name="folderPath"></param>. 
        /// 
        /// See more information on R Squared at https://en.wikipedia.org/wiki/Coefficient_of_determination. 
        /// </summary>
        /// <param name="trainData">IDataView used to train the model.</param>
        /// <param name="model">Model used for predictions.</param>
        /// <param name="labelColumnName">Name of the predicted label column.</param>
        /// <param name="folderPath">Folder path to save the RegressionChart.html file into.</param>
        public static void PlotRSquaredValues(IDataView trainData, ITransformer model, string labelColumnName, string folderPath)
        {
            // Number of rows to display in charts.
            int numberOfRows = 1000;
            // Use the model to make batch predictions on training data
            var testResults = model.Transform(trainData);

            // Get the actual values from the dataset
            var trueValues = testResults.GetColumn<float>(labelColumnName).Take(numberOfRows); ;

            // Get the predicted values from the test results
            var predictedValues = testResults.GetColumn<float>("Score").Take(numberOfRows);

            // Setup what the graph looks like
            var title = Title.init(Text: "R-Squared Plot");
            var layout = Layout.init<IConvertible>(Title: title, PlotBGColor: Plotly.NET.Color.fromString("#e5ecf6"));
            var xAxis = LinearAxis.init<IConvertible, IConvertible, IConvertible, IConvertible, IConvertible, IConvertible>(
                    Title: Title.init("True Values"),
                    ZeroLineColor: Plotly.NET.Color.fromString("#ffff"),
                    GridColor: Plotly.NET.Color.fromString("#ffff"),
                    ZeroLineWidth: 2);
            var yAxis = LinearAxis.init<IConvertible, IConvertible, IConvertible, IConvertible, IConvertible, IConvertible>(
                    Title: Title.init("Predicted Values"),
                    ZeroLineColor: Plotly.NET.Color.fromString("#ffff"),
                    GridColor: Plotly.NET.Color.fromString("#ffff"),
                    ZeroLineWidth: 2);

            // We will plot the line that shows the perfect result. Setup that line here.
            var maximumValue = Math.Max(trueValues.Max(), predictedValues.Max());
            var perfectX = new[] { 0, maximumValue };
            var perfectY = new[] { 0, maximumValue };



            // Create the scatterplot that shows the true values vs the predicted values
            var trueAndPredictedValues = Chart2D.Chart.Scatter<float, float, string>(x: trueValues, y: predictedValues, mode: StyleParam.Mode.Markers)
                            .WithLayout(layout)
                            .WithXAxis(xAxis)
                            .WithYAxis(yAxis);

            // Setup the line that shows what a perfect prediction would look like
            var perfectLineGraph = Chart2D.Chart.Line<float, float, string>(x: perfectX, y: perfectY)
                            .WithLayout(layout)
                            .WithLine(Line.init(Width: 1.5));

            var chartWithValuesAndIdealLine = Chart.Combine(new[] { trueAndPredictedValues, perfectLineGraph });
            var chartFilePath = folderPath + "\\RegressionChart.html";

            chartWithValuesAndIdealLine.SaveHtml(chartFilePath);
        }
    }
}


