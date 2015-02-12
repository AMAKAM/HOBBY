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
	static long changes =0;
	public static void main (String[] args) throws FileNotFoundException
	{
		
		Scanner scanner = new Scanner(System.in);
		String inputFile,outputFile;
		ArrayList<Integer> array = new ArrayList<Integer>(); 
		
		//Get Input File Name 
		//System.out.println("Enter Input File name to be sorted");
		//inputFile = scanner.next();
		inputFile = "output1.txt";
		
		//Get Input File Name
		//System.out.println("Enter Output File name to be sorted");
		//outputFile = scanner.next();
		outputFile = "output1.txt";
		scanner.close();
		array = readFile(inputFile);
		//System.out.println(array.size());
		ArrayList<Integer> return_array = new ArrayList<Integer>(mergeSort(array));		
		writeFile(return_array,outputFile); 
		//System.out.println("Wait for it");
		//System.out.println("duplicates"+duplicates(array));
		//System.out.println("n2 Changes" + findchange(array)); 
		System.out.println("Changes "+changes);
		
		
			
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
	static void writeFile (ArrayList<Integer> array,String outputFile) throws FileNotFoundException
	{
		try {
			Writer writer = new BufferedWriter(new OutputStreamWriter( new FileOutputStream(outputFile), "utf-8"));
				for (Integer num:array)
				{
					writer.write(String.valueOf(num));
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
	static ArrayList<Integer> mergeSort (ArrayList<Integer> array,int start,int end) { 
	int size = end - start + 1 ;//added 1 because inclusive range // can be simplified as end - start > 0
	//System.out.println("Size " +size);
	//System.out.println(start + " " + end );
	if (size >1)  	
		{
			int odd;
			int start1=0,start2=0,end1=0,end2=0,halfSize;
			if (size%2 ==0) odd = 0; else odd= 1;
			switch (odd)
				{
				case 0:          // even
					halfSize = size /2 ;  
					start1= start;
					end1= start1 + halfSize -1;
					start2= end1+1;					
					end2= end;
					break;
					
				case 1:			//odd
					halfSize = (size -1) /2;
					start1= start;
					end1= start1 + halfSize;
					start2= end1 +1; 
					end2= end;
				
			}
			int left_ptr,right_ptr,maxLeft,maxRight;
			left_ptr = 0;
			right_ptr =0;
			maxLeft = end1 - start1 +1;
			maxRight = end2 - start2 + 1;
			
			//System.out.println(start1 + " " + end1 );
			//System.out.println(start2 + " " + end2 );
			//System.out.print("Left Recursion");
			ArrayList<Integer> left = mergeSort(array,start1,end1);
			//System.out.print("Right Recursion");
			
			ArrayList<Integer> right = mergeSort(array,start2,end2);
			ArrayList<Integer> returnArray = new ArrayList<Integer>();
			int k;
			//System.out.print(maxLeft + ","+maxRight + " ");
			for (k=0;k<maxLeft+maxRight;k++)
			{
				boolean leftFinished;
				boolean rightFinished;
				if (maxLeft > left_ptr) 
					leftFinished = false;
				else	
					leftFinished = true;
				if (maxRight > right_ptr) 
					rightFinished = false;
				else
					rightFinished = true;
				
				int leftElement,rightElement;
				
				if (leftFinished == true){
					 rightElement = right.get(right_ptr);
					returnArray.add(rightElement);
					right_ptr++;
					}	
				else if (rightFinished ==true)
					{
					 leftElement = left.get(left_ptr); 					
					 returnArray.add(leftElement);
					 left_ptr++;
					}
				//System.out.println(left_ptr+ "  " +maxLeft  + "  " + leftFinished + " " 
				//	+right_ptr+ "  " +maxRight  + "  " + rightFinished);
				//System.out.println(leftFinished + "  " + rightFinished);
				if (leftFinished == false && rightFinished == false)
				{
				leftElement = left.get(left_ptr); 
				rightElement = right.get(right_ptr);				
				
				if (leftElement < rightElement) 
				{
					returnArray.add(leftElement);
					left_ptr++;
				}
				else 
				{
					returnArray.add(rightElement);
					changes = changes + (maxLeft - left_ptr);
					right_ptr++;
				}
				}
			}
			//System.out.println(returnArray);
			return returnArray;
		}
	else
		{
		ArrayList<Integer> returnArray = new ArrayList<Integer>();
		returnArray.add(array.get(start));
		return returnArray;
		}			
	}
	
	static ArrayList<Integer> mergeSort (ArrayList<Integer> array) {
		return mergeSort(array,0,array.size() -1);
	}
	
	//0(N^2) ALGORITHM TO FIND THE CHANGES
	static int findchange(ArrayList<Integer> array){
		int no_change=0;
		int size = array.size();
		int i,j;
		for (i=0;i<size;i++)
		{
			int currentElem = array.get(i);
			int temp_change=0;
			for (j=i+1;j<size;j++)
				{
					if(currentElem>array.get(j))
						temp_change++;
				}
			//System.out.println(temp_change);
			no_change = no_change + temp_change;
		}
		return no_change;
	}
	
	//CHECK FOR DUPLICATES
	static int duplicates(ArrayList<Integer> array){
		int duplicates=0; 
		int size = array.size();
		int i,j;
		for (i=0;i<size;i++)
		{
			int currentElem = array.get(i);
			int temp_change=0;
			for (j=0;j<size;j++)
				{
					if(currentElem==array.get(j))
						temp_change++;
				}
			//System.out.println(temp_change);
			duplicates = duplicates + temp_change;
		}
		return duplicates - size;
	}
	
}
