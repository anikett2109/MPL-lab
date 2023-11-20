import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DataAnalysisPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 23, 45),
      appBar: AppBar(
        title: const Text('Analysis'),
        backgroundColor: const Color.fromARGB(255, 0, 23, 45),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
      height: 300,
      decoration: BoxDecoration(
        color: const Color.fromARGB(83, 158, 158, 158),
        borderRadius: BorderRadius.circular(12),
      ),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceEvenly,
          groupsSpace: 10,
          titlesData: const FlTitlesData(
            
          ),
          barGroups: [
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  fromY: 50000,
                  toY: 75000,
                  color: Colors.green,
                ),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  fromY: 50000,
                  toY: 80000,
                  color: Colors.green,
                ),
              ],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [
                BarChartRodData(
                  fromY: 50000,
                  toY: 90000,
                  color: Colors.green,
                ),
              ],
            ),
            BarChartGroupData(
              x: 4,
              barRods: [
                BarChartRodData(
                  fromY: 50000,
                  toY: 100000,
                  color: Colors.deepOrangeAccent,
                ),
              ],
            ),
            BarChartGroupData(
              x: 4,
              barRods: [
                BarChartRodData(
                  fromY: 50000,
                  toY: 80000,
                  color: Colors.red,
                ),
              ],
            ),
            // Add more BarChartGroupData as needed
          ],
        ),
      ),
    ),
              const SizedBox(height: 50 , 
              child: Center(child: Text("2023 Financial Data" , style: TextStyle(color: Colors.white, fontSize: 15),)),),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(83, 158, 158, 158),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: true),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    minX: 0,
                    maxX: 10,
                    minY: 0,
                    maxY: 12,
                    lineBarsData: [
                      LineChartBarData(
                        spots: const [
                          FlSpot(1, 2),
                          FlSpot(1, 2),
                          FlSpot(3, 10),
                          FlSpot(4, 5),
                          FlSpot(5, 11),
                          // Add more FlSpot as needed
                        ],
                        isCurved: true,
                        color: Colors.white,
                        dotData: FlDotData(show: true),
                        belowBarData: BarAreaData(show: true),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50 , 
              child: Center(child: Text("2023 Growth: Year / Revenue" , style: TextStyle(color: Colors.white, fontSize: 15),)),),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.5,
                      decoration:  BoxDecoration(
                        color: const Color.fromARGB(83, 158, 158, 158),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(children: [
                          Container(height: 10, width: 10,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          ), 
                          const SizedBox(width: 5,),
                          const Text("18-25" , style: TextStyle(color: Colors.white),),
                          const SizedBox(width: 5,),
                          Container(height: 10, width: 10,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          ),
                          const SizedBox(width: 5,), 
                          const Text("AGE 40-60+" , style: TextStyle(color: Colors.white),),
                          const SizedBox(width: 5,),
                          Container(height: 10, width: 10,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          ),
                          SizedBox(width: 5,), 
                          Text("AGE 25-40" , style: TextStyle(color: Colors.white),),
                        ],),
                      ),
                    )
                  ],),
                  SizedBox(height: 10,),
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(83, 158, 158, 158),
                      
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 0,
                        centerSpaceRadius: 50,
                        sections: [
                          PieChartSectionData(
                            value: 40,
                            color: Colors.blue,
                            title: '40%',
                            radius: 50,
                            titleStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffffffff),
                            ),
                          ),
                          PieChartSectionData(
                            value: 30,
                            color: Colors.green,
                            title: '30%',
                            radius: 50,
                            titleStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          PieChartSectionData(
                            value: 20,
                            color: Colors.red,
                            title: '20%',
                            radius: 50,
                            titleStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffffffff),
                            ),
                          ),
                          // Add more PieChartSectionData as needed
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50 , 
              child: Center(child: Text("Target Customers" , style: TextStyle(color: Colors.white, fontSize: 15),)),),
              
            ],
          ),
        ),
      ),
    );
  }
}



