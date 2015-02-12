package code;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Scanner;

public class Main {
	static long comparisons =0;
	public static void main (String[] args) throws FileNotFoundException
	{	
		Scanner scanner = new Scanner(System.in);
		String inputFile,outputFile;
		ArrayList<Integer> list ;

		//Get Input File Name 
		//System.out.println("Enter Input File name to be sorted");
		//inputFile = scanner.next();
		inputFile = "input1.txt";

		list = new ArrayList<Integer>(readFile(inputFile)); 
		
		//Get Input File Name
		//System.out.println("Enter Output File name to be sorted");
		//outputFile = scanner.next();
		outputFile = "output1.txt";
		scanner.close();
		
		int size = list.size();
		int[] array = new int[size];
		
		for (int i=0;i<size;i++)
			array[i] = list.get(i);
		
		//System.out.println(array[findPivotIndexMedian(array,2,5)]);
		//System.out.println("Before");
		//for (int i=0;i<10;i++)
		//	System.out.println(array[i]);
		
		quickSort(array,size);
		
		//System.out.println("After");
		//for (int i=0;i<10;i++)
		//	System.out.println(array[i]);
		writeFile(array,size,outputFile);
		System.out.println(comparisons);
		
	}	
	
	static ArrayList<Integer> readFile(String inputFile) throws FileNotFoundException
	{
		ArrayList<Integer> array = new ArrayList<Integer>();
		try {
			BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(inputFile)));
			String value = null;
			while((value = reader.readLine())!=null)
				{
					array.add(Integer.parseInt(value));
				}
			reader.close();
		}
		catch (Exception e)
		{
			System.out.println("Some Error in reading file");
			e.printStackTrace();
		}	
		return array;
	} 
	static void writeFile (int[] array,int size,String outputFile) throws FileNotFoundException

	{
		try {
			Writer writer = new BufferedWriter(new OutputStreamWriter( new FileOutputStream(outputFile), "utf-8"));
				for (int i=0;i<size;i++)
				{
					writer.write(String.valueOf(array[i]));
					writer.write("\n");					
				}
				writer.flush();
				writer.close();
			}
			catch (Exception e)
			{
				System.out.println("Some Error in writing file");
				e.printStackTrace();
			}
	}
	static void quickSort (int[] array,int size){	
		 quickSortRecursive(array,0,size-1);
	}
	static void  quickSortRecursive (int[] array,int start,int end){	
		int size = end - start +1 ; // inclusive	
		if (size>1)						// divide and conquer
			{
				comparisons = comparisons + size - 1; 
				//int pivotIndex = findPivotIndexFirst(start,end);
				//int pivotIndex = findPivotIndexLast(start,end);
				int pivotIndex = findPivotIndexMedian(array,start,end);
				
				if (pivotIndex!= start) 
					{
						int temp = array[pivotIndex];
						array[pivotIndex] = array[start];
						array[start] = temp;
					}
				int pivot = array[start];
				int minBoundary =start+1,maxBoundary=start+1;
				for(int index = start +1;index<=end;index++)
				{
					int element = array[index];
					if(element > pivot)
						maxBoundary++;
					else
					{
						int swap = array [minBoundary];
						array[minBoundary] = element; 
						array[index] = swap;
						minBoundary++;
						maxBoundary++;
					}	
				}
				array[start] = array[minBoundary-1];
				array[minBoundary-1]= pivot;
				quickSortRecursive(array,start,minBoundary-2);
				// minBoundary -1 is the pivot..
				quickSortRecursive(array,minBoundary,end);
			}
	}
	static int findPivotIndexFirst (int start,int end) {
		return start;
	}
	static int findPivotIndexLast (int start,int end){
		return end;
	}
	static int findPivotIndexMedian (int[] array,int start,int end){
		int range = end - start +1; //inclusive
		int a = array[start];
		int b = array[end];
		int third;
		if (range %2 ==0)
			third = start + (range/2)-1;
		else 			
			third = start + (range-1)/2;
		int c = array[third];
		//System.out.println(a + " " + b + " " + c);
		int m = median(a,b,c);		
		if (m==a) return start;
		if (m ==b) return end;
		if (m==c) return third;
		return -1;
	}
	
	static int median(int a,int b,int c){
		
		if (a>b) {
				if (c>b)
					if (c<a)	return c;
					else 		return a;
				else
					return b;
			}
		else 
			{
				if (c>a) 
					if (c<b)	return c;
					else 		return b;
				else
					return a;
			}
	} 
}

//7-12
//3-7
//8-12



