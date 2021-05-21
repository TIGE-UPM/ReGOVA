import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;



public class JsonFormatter {

	public static void main(String[] args) throws IOException {
		try {
			FileWriter csvWriter = new FileWriter("salida.xls"); //genera el fichero de salida
			FileInputStream fis = new FileInputStream("entrada.json");//lee el fichero de entrada
		       InputStreamReader isr = new InputStreamReader(fis, StandardCharsets.UTF_8);//codifica en UTF-8
		       BufferedReader fr = new BufferedReader(isr);
					
			int n= 0; int b=0; int c= 0; int d=0; int e=0; int f=0; int g=0; int h=0; int j=0; int k=0; int l=0; int m=0; int t=0; int o=0; int p=0; int q=0; int r=0; int s=0;int u=0;int v=0;int w=0;
			int x= 0;int y= 0;int z= 0;int aa= 0;int ab= 0;int ac= 0;int ad= 0;int ae= 0;int af= 0;int ag= 0;int ah= 0;int ai= 0;int aj= 0;int ak= 0;int al= 0;int am= 0;int an= 0;int ao= 0;int ap= 0;
			int aq= 0;int ar= 0;int as= 0;int at= 0;
			
			String line; 
			String[] linelat= {"", ""}; // se crea el array vacío
			String[] linelong= {"", ""}; 
			String[] line1= {"", ""}; 
			String[] line2= {"", ""}; 
			String[] line3= {"", ""};
			String[] line4= {"", ""}; 
			String[] line5= {"", ""}; 
			String[] line6= {"", ""}; 
			String[] line7= {"", ""}; 
			String[] line8= {"", ""}; 
			String[] line9= {"", ""};
			String[] line10= {"", ""}; 
			String[] line11= {"", ""};
			String[] line12= {"", ""}; 
			String[] line13= {"", ""}; 
			String[] line14= {"", ""};
			String[] line15= {"", ""}; 
			String[] line16= {"", ""}; 

			String[] listalat =new String [161];
			String[] listalong =new String [161];
			String[] lista1 =new String [161];
			String[] lista2 =new String [161];
			String[] lista31 =new String [161];
			String[] lista32 =new String [161];
			String[] lista33 =new String [161];
			String[] lista4 =new String [161];
			String[] lista41 =new String [161];
			String[] lista42 =new String [161];
			String[] lista43 =new String [161];
			String[] lista44 =new String [161];
			String[] lista45 =new String [161];
			String[] lista46 =new String [161];
			String[] lista47 =new String [161];
			String[] lista48 =new String [161];
			String[] lista49 =new String [161];
			String[] lista51 =new String [161];
			String[] lista52 =new String [161];
			String[] lista53 =new String [161];
			String[] lista6 =new String [161];
			String[] lista61 =new String [161];
			String[] lista62 =new String [161];
			String[] lista63 =new String [161];
			String[] lista64 =new String [161];
			String[] lista65 =new String [161];
			String[] lista66 =new String [161];
			String[] lista67 =new String [161];
			String[] lista71 =new String [161];
			String[] lista72 =new String [161];
			String[] lista73 =new String [161];
			String[] lista74 =new String [161];
			String[] lista75 =new String [161];
			String[] lista76 =new String [161];
			String[] lista8 =new String [161];
			String[] lista81 =new String [161];
			String[] lista82 =new String [161];
			String[] lista83 =new String [161];
			String[] lista84 =new String [161];
			String[] lista85 =new String [161];
			String[] lista86 =new String [161];
			String[] lista87 =new String [161];
			String[] lista88 =new String [161];
			String[] lista89 =new String [161];
			String[] lista9 =new String [161];
			String[] lista91 =new String [161];
			String[] lista92 =new String [161];
			String[] lista93 =new String [161];
			String[] lista94 =new String [161];
			String[] lista95 =new String [161];
			String[] lista96 =new String [161];
			String[] lista97 =new String [161];
			String[] lista98 =new String [161];
			String[] lista101 =new String [161];
			String[] lista102 =new String [161];
			String[] lista103 =new String [161];
			String[] lista104 =new String [161];
			String[] lista105 =new String [161];
			String[] lista106 =new String [161];
			String[] lista111 =new String [161];
			String[] lista112 =new String [161];
			String[] lista113 =new String [161];
			String[] lista121 =new String [161];
			String[] lista122 =new String [161];
			String[] lista123 =new String [161];
			String[] lista124 =new String [161];
			String[] lista125 =new String [161];
			String[] lista126 =new String [161];
			String[] lista127 =new String [161];
			String[] lista131 =new String [161];
			String[] lista132 =new String [161];
			String[] lista133 =new String [161];
			String[] lista134 =new String [161];
			String[] lista137 =new String [161];
			String[] lista14 =new String [161];
			String[] lista15 =new String [161];
			String[] lista16 =new String [161];

			csvWriter.append("\t"); // tabulador para hacer una nueva columna 
			csvWriter.append("latitude");
			csvWriter.append("\t");
			csvWriter.append("longitude");
			csvWriter.append("\t");
			csvWriter.append("P1");
			csvWriter.append("\t");
			csvWriter.append("P2");
			csvWriter.append("\t");
			csvWriter.append("P3.1");
			csvWriter.append("\t");
			csvWriter.append("P3.2");
			csvWriter.append("\t");
			csvWriter.append("P3.3");
			csvWriter.append("\t");
			csvWriter.append("P4");
			csvWriter.append("\t");
			csvWriter.append("P4.1");
			csvWriter.append("\t");
			csvWriter.append("P4.2"); 
			csvWriter.append("\t");
			csvWriter.append("P4.3");
			csvWriter.append("\t");
			csvWriter.append("P4.4");
			csvWriter.append("\t");
			csvWriter.append("P4.5");
			csvWriter.append("\t");
			csvWriter.append("P4.6");
			csvWriter.append("\t");
			csvWriter.append("P4.7");
			csvWriter.append("\t");
			csvWriter.append("P4.8");
			csvWriter.append("\t");
			csvWriter.append("P4.9");
			csvWriter.append("\t");
			csvWriter.append("P5.1");
			csvWriter.append("\t");
			csvWriter.append("P5.2");
			csvWriter.append("\t");
			csvWriter.append("P5.3");
			csvWriter.append("\t");
			csvWriter.append("P6");
			csvWriter.append("\t");
			csvWriter.append("P6.1");
			csvWriter.append("\t");
			csvWriter.append("P6.2");
			csvWriter.append("\t");
			csvWriter.append("P6.3");
			csvWriter.append("\t");
			csvWriter.append("P6.4");
			csvWriter.append("\t");
			csvWriter.append("P6.5");
			csvWriter.append("\t");
			csvWriter.append("P6.6");
			csvWriter.append("\t");
			csvWriter.append("P6.7");
			csvWriter.append("\t");
			csvWriter.append("P7.1");
			csvWriter.append("\t");
			csvWriter.append("P7.2");
			csvWriter.append("\t");
			csvWriter.append("P7.3");
			csvWriter.append("\t");
			csvWriter.append("P7.4");
			csvWriter.append("\t");
			csvWriter.append("P7.5");
			csvWriter.append("\t");
			csvWriter.append("P7.6");
			csvWriter.append("\t");
			csvWriter.append("P8");
			csvWriter.append("\t");
			csvWriter.append("P8.1");
			csvWriter.append("\t");
			csvWriter.append("P8.2");
			csvWriter.append("\t");
			csvWriter.append("P8.3");
			csvWriter.append("\t");
			csvWriter.append("P8.4");
			csvWriter.append("\t");
			csvWriter.append("P8.5");
			csvWriter.append("\t");
			csvWriter.append("P8.6");
			csvWriter.append("\t");
			csvWriter.append("P8.7");
			csvWriter.append("\t");
			csvWriter.append("P8.8");
			csvWriter.append("\t");
			csvWriter.append("P8.9");
			csvWriter.append("\t");
			csvWriter.append("P9");
			csvWriter.append("\t");
			csvWriter.append("P9.1");
			csvWriter.append("\t");
			csvWriter.append("P9.2");
			csvWriter.append("\t");
			csvWriter.append("P9.3");
			csvWriter.append("\t");
			csvWriter.append("P9.4");
			csvWriter.append("\t");
			csvWriter.append("P9.5");
			csvWriter.append("\t");
			csvWriter.append("P9.6");
			csvWriter.append("\t");
			csvWriter.append("P9.7");
			csvWriter.append("\t");
			csvWriter.append("P9.8");
			csvWriter.append("\t");
			csvWriter.append("P10.1");
			csvWriter.append("\t");
			csvWriter.append("P10.2");
			csvWriter.append("\t");
			csvWriter.append("P10.3");
			csvWriter.append("\t");
			csvWriter.append("P10.4");
			csvWriter.append("\t");
			csvWriter.append("P10.5");
			csvWriter.append("\t");
			csvWriter.append("P10.6");
			csvWriter.append("\t");
			csvWriter.append("P11.1");
			csvWriter.append("\t");
			csvWriter.append("P11.2");
			csvWriter.append("\t");
			csvWriter.append("P11.3");
			csvWriter.append("\t");
			csvWriter.append("P12.1");
			csvWriter.append("\t");
			csvWriter.append("P12.2");
			csvWriter.append("\t");
			csvWriter.append("P12.3");
			csvWriter.append("\t");
			csvWriter.append("P12.4");
			csvWriter.append("\t");
			csvWriter.append("P12.5");
			csvWriter.append("\t");
			csvWriter.append("P12.6");
			csvWriter.append("\t");
			csvWriter.append("P12.7");
			csvWriter.append("\t");
			csvWriter.append("P13.1");
			csvWriter.append("\t");
			csvWriter.append("P13.2");
			csvWriter.append("\t");
			csvWriter.append("P13.3");
			csvWriter.append("\t");
			csvWriter.append("P13.4");
			csvWriter.append("\t");
			csvWriter.append("P13.5");
			csvWriter.append("\t");
			csvWriter.append("P14");
			csvWriter.append("\t");
			csvWriter.append("P15");
			csvWriter.append("\t");
			csvWriter.append("P16");
			csvWriter.append("\t");
			csvWriter.append("\n");// retorno de carro

			while ((line = fr.readLine()) != null) { //se recorre el fichero línea por línea
				
				if (line.contains("latitude")) { // si la línea contiene latitude 
					am++;
					linelat=line.split(":|\\,"); //se separa en los : y en ,
					System.out.println(linelat[1]);
					double str1 = Double.valueOf(linelat[1]);
					String a =String.format("%.5f", str1); // se guardan 5 decimales
					listalat[am-1]=a;
				}

				if (line.contains("longitude")) {
					an++;
					linelong=line.split(":|\\,"); 
					System.out.println(linelong[1]);
					double str1 = Double.valueOf(linelong[1]);
					String a =String.format("%.5f", str1);
					listalong[an-1]=a;
					System.out.println(a);
				}

				if(line.contains("\"1\" :")){
					e++;
					line1=line.split(" : "); 
					System.out.println(line1[1]);
					lista1[e-1]=line1[1];
				}

				if(line.contains("\"2\" :")){
					f++;
					line2=line.split(" :|\\,"); 
					System.out.println(line2[1]);
					lista2[f-1]=line2[1];
				}

				if(line.contains("\"3\" :")){
					while( (line = fr.readLine()) != null) {
						if(line.contains("value")) {
							line3=line.split(" :"); 
							if(line.contains("1")) {
								g++;
								System.out.println(line3[1]);
								lista31[g-1]="1";
							}
							else {g++; lista31[g-1]="0";}
							if(line.contains("2")) {
								h++;
								System.out.println(line3[1]);
								lista32[h-1]="1";
							}
							else {h++; lista32[h-1]="0";}
							if(line.contains("3")) {
								j++;
								System.out.println(line3[1]);
								lista33[j-1]="1";
							}
							else {j++; lista33[j-1]="0";}
						}
						if(line.contains("}")) {
							break;
						}
					}
				}
				if(line.contains("\"4\" :")){
					int count= 0;
					n ++;
					while( (line = fr.readLine()) != null) {	
						if(line.contains("value")) {
							line4=line.split(" :"); 
							if(line.contains("1")) {
								System.out.println(line4[1]);
								lista41[n-1]="1";
								count++;
							}
							if(line.contains("2")) {
								System.out.println(line4[1]);
								lista42[n-1]="1";
								count++;								
							}
							if(line.contains("3")) {
								System.out.println(line4[1]);
								lista43[n-1]="1";
								count++;								
							}
							if(line.contains("4")) {
								System.out.println(line4[1]);
								lista44[n-1]="1";
								count++;								
							}
							if(line.contains("5")) {
								System.out.println(line4[1]);
								lista45[n-1]="1";
								count++;								
							}
							if(line.contains("6")) {
								System.out.println(line4[1]);
								lista46[n-1]="1";
								count++;								
							}
							if(line.contains("7")) {
								System.out.println(line4[1]);
								lista47[n-1]="1";
								count++;							
							}
							if(line.contains("8")) {
								System.out.println(line4[1]);
								lista48[n-1]="1";
							}
							if(line.contains("9")) {
								System.out.println(line4[1]);
								lista49[n-1]="1";
							}
						}
						if(line.contains("]")) { 

							for (int a=0; a<listalat.length; a++ ) {
								if (lista41[a] !="1") {
									lista41[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista42[a] !="1") {
									lista42[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista43[a] !="1") {
									lista43[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista44[a] !="1") {
									lista44[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista45[a] !="1") {
									lista45[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista46[a] !="1") {
									lista46[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista47[a] !="1") {
									lista47[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista48[a] !="1") {
									lista48[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista49[a] !="1") {
									lista49[a] = "0";

								}
							}

							String a = "" + count;
							lista4[n-1]=a;

							break;
						}
					}
				}


				if(line.contains("\"5\" :")){
					while( (line = fr.readLine()) != null) {
						if(line.contains("value")) {
							line5=line.split(" :"); 
							if(line.contains("1")) {
								k++;
								System.out.println(line5[1]);
								lista51[k-1]="1";
							}
							else {k++;lista51[k-1]="0";}
							if(line.contains("2")) {
								l++;
								System.out.println(line5[1]);
								lista52[l-1]="1";
							}
							else {l++;lista52[k-1]="0";}

							if(line.contains("3")) {
								m++;
								System.out.println(line5[1]);
								lista53[m-1]="1";
							}
							else {m++;lista53[m-1]="0";}
						}
						if(line.contains("}")) {
							break;
						}
					}
				}
				if(line.contains("\"6\" :")){
					int count= 0;
					b++;
					while( (line = fr.readLine()) != null) {
						if(line.contains("value")) {
							line6=line.split(" :"); 
							if(line.contains("1")) {
								lista61[b-1]="1";
								count++;
							}
							if(line.contains("2")) {
								System.out.println(line6[1]);
								lista62[b-1]="1";
								count++;
							}
							if(line.contains("3")) {
								System.out.println(line6[1]);
								lista63[b-1]="1";
								count++;
							}
							if(line.contains("4")) {
								System.out.println(line6[1]);
								lista64[b-1]="1";
								count++;
							}
							if(line.contains("5")) {
								System.out.println(line6[1]);
								lista65[b-1]="1";
								count++;
							}
							if(line.contains("6")) {
								System.out.println(line6[1]);
								lista66[b-1]="1";
								count++;
							}
							if(line.contains("7")) {
								System.out.println(line6[1]);
								lista67[b-1]="1";
							}
						}
						if(line.contains("]")) {
							for (int a=0; a<listalat.length; a++ ) {
								if (lista61[a] !="1") {
									lista61[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista62[a] !="1") {
									lista62[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista63[a] !="1") {
									lista63[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista64[a] !="1") {
									lista64[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista65[a] !="1") {
									lista65[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista66[a] !="1") {
									lista66[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista67[a] !="1") {
									lista67[a] = "0";

								}
							}
							String a = "" + count;
							lista6[b-1]=a;

							break;
						}
					}
				}
				if(line.contains("\"7\" :")){
					while( (line = fr.readLine()) != null) {
						if(line.contains("value")) {
							line7=line.split(" :"); 
							if(line.contains("1")) {
								ao++;
								System.out.println(ao);
								lista71[ao-1]="1";
							}
							else {ao++;lista71[ao-1]="0";}
							if(line.contains("2")) {
								ap++;
								System.out.println(line7[1]);
								lista72[ap-1]="1";
							}
							else {ap++;lista72[ap-1]="0";}
							if(line.contains("3")) {
								aq++;
								System.out.println(line7[1]);
								lista73[aq-1]="1";
							}
							else {aq++;lista73[aq-1]="0";}
							if(line.contains("4")) {
								ar++;
								System.out.println(line7[1]);
								lista74[ar-1]="1";
							}
							else {ar++;lista74[ar-1]="0";}
							if(line.contains("5")) {
								as++;
								System.out.println(line7[1]);
								lista75[as-1]="1";
							}
							else {as++;lista75[as-1]="0";}
							if(line.contains("6")) {
								at++;
								System.out.println(line7[1]);
								lista76[at-1]="1";
							}
							else {at++;lista76[at-1]="0";}
						}
						if(line.contains("}")) {
							break;
						}
					}
				}
				if(line.contains("\"8\" :")){
					int count=0;
					c++;
					while( (line = fr.readLine()) != null) {
						if(line.contains("value")) {
							line8=line.split(" :"); 
							if(line.contains("1")) {
								System.out.println(line8[1]);
								lista81[c-1]="1";
							}
							if(line.contains("2")) {
								System.out.println(line8[1]);
								lista82[c-1]="1";
							}
							if(line.contains("3")) {
								System.out.println(line8[1]);
								lista83[c-1]="1";
								count++;
							}
							if(line.contains("4")) {
								System.out.println(line8[1]);
								lista84[c-1]="1";
								count++;
							}
							if(line.contains("5")) {
								System.out.println(line8[1]);
								lista85[c-1]="1";
								count++;
							}
							if(line.contains("6")) {
								System.out.println(line8[1]);
								lista86[c-1]="1";
								count++;
							}
							if(line.contains("7")) {
								System.out.println(line8[1]);
								lista87[c-1]="1";
								count++;
							}
							if(line.contains("8")) {
								System.out.println(line8[1]);
								lista88[c-1]="1";
								count++;
							}
							if(line.contains("9")) {
								System.out.println(line8[1]);
								lista89[c-1]="1";
							}
						}
						if(line.contains("]")) {
							for (int a=0; a<listalat.length; a++ ) {
								if (lista81[a] !="1") {
									lista81[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista82[a] !="1") {
									lista82[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista83[a] !="1") {
									lista83[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista84[a] !="1") {
									lista84[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista85[a] !="1") {
									lista85[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista86[a] !="1") {
									lista86[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista87[a] !="1") {
									lista87[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista88[a] !="1") {
									lista88[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista89[a] !="1") {
									lista89[a] = "0";

								}
							}
							String a = "" + count;
							lista8[c-1]=a;


							break;
						}
					}
				}
				if(line.contains("\"9\" :")){
					int count=0;
					d++;
					while( (line = fr.readLine()) != null) {
						if(line.contains("value")) {
							line9=line.split(" :"); 
							if(line.contains("1")) {
								System.out.println(line9[1]);
								lista91[d-1]="1";
							}
							if(line.contains("2")) {
								System.out.println(line9[1]);
								lista92[d-1]="1";
								count++;
							}
							if(line.contains("3")) {
								System.out.println(line9[1]);
								lista93[d-1]="1";
								count++;
							}
							if(line.contains("4")) {
								System.out.println(line9[1]);
								lista94[d-1]="1";
								count++;
							}
							if(line.contains("5")) {
								System.out.println(line9[1]);
								lista95[d-1]="1";
								count++;
							}
							if(line.contains("6")) {
								System.out.println(line9[1]);
								lista96[d-1]="1";
								count++;
							}
							if(line.contains("7")) {
								System.out.println(line9[1]);
								lista97[d-1]="1";
								count++;
							}
							if(line.contains("8")) {
								System.out.println(line9[1]);
								lista98[d-1]="1";
							}
						}
						if(line.contains("]")) {
							for (int a=0; a<listalat.length; a++ ) {
								if (lista91[a] !="1") {
									lista91[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista92[a] !="1") {
									lista92[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista93[a] !="1") {
									lista93[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista94[a] !="1") {
									lista94[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista95[a] !="1") {
									lista95[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista96[a] !="1") {
									lista96[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista97[a] !="1") {
									lista97[a] = "0";

								}
							}
							for (int a=0; a<listalat.length; a++ ) {
								if (lista98[a] !="1") {
									lista98[a] = "0";

								}
							}
							String a = "" + count;
							lista9[d-1]=a;
							break;
						}
					}
				}
				if(line.contains("\"10\" :")){
					while( (line = fr.readLine()) != null) {
						if(line.contains("value")) {
							line10=line.split(":"); 
							if(line.contains("1")) {
								t++;
								System.out.println(line10[1]);
								lista101[t-1]="1";
							}
							else {t++;lista101[t-1]="0";}
							if(line.contains("2")) {
								o++;
								System.out.println(line10[1]);
								lista102[o-1]="1";
							}
							else {o++;lista102[o-1]="0";}
							if(line.contains("3")) {
								System.out.println(line10[1]);
								p++;
								lista103[p-1]="1";
							}
							else {p++;lista103[p-1]="0";}
							if(line.contains("4")) {
								q++;
								System.out.println(line10[1]);
								lista104[q-1]="1";
							}
							else {q++;lista104[q-1]="0";}
							if(line.contains("5")) {
								r++;
								System.out.println(line10[1]);
								//lista105.add("1");
								lista105[r-1]="1";
							}
							else {r++;lista105[r-1]="0";}
							if(line.contains("6")) {
								s++;
								System.out.println(line10[1]);
								lista106[s-1]="1";
							}
							else {s++;lista106[s-1]="0";}
						}
						if(line.contains("}")) {
							break;
						}
					}
				}

				if(line.contains("\"11\" :")){
					while( (line = fr.readLine()) != null) {
						if(line.contains("value")) {
							line11=line.split(" :"); 
							if(line.contains("1")) {
								u++;
								System.out.println(line11[1]);
								lista111[u-1]="1";
							}
							else {u++;lista111[u-1]="0";}
							if(line.contains("2")) {
								v++;
								System.out.println(line11[1]);
								lista112[v-1]="1";
							}
							else {v++;lista112[v-1]="0";}
							if(line.contains("3")) {
								w++;
								System.out.println(line11[1]);
								lista113[w-1]="1";
							}
							else {w++;lista113[w-1]="0";}
						}
						if(line.contains("}")) {
							break;
						}
					}
				}
				if(line.contains("\"12\" :")){
					while( (line = fr.readLine()) != null) {
						if(line.contains("value")) {
							line12=line.split(" :"); 
							if(line.contains("1")) {
								x++;
								System.out.println(line12[1]);
								lista121[x-1]="1";
							}
							else {x++;lista121[x-1]="0";}
							if(line.contains("2")) {
								y++;
								System.out.println(line12[1]);
								lista122[y-1]="1";
							}
							else {y++;lista122[y-1]="0";}
							if(line.contains("3")) {
								z++;
								System.out.println(line12[1]);
								lista123[z-1]="1";
							}
							else {z++;lista123[z-1]="0";}
							if(line.contains("4")) {
								aa++;
								System.out.println(line12[1]);
								lista124[aa-1]="1";
							}
							else {aa++;lista124[aa-1]="0";}
							if(line.contains("5")) {
								ab++;
								System.out.println(line12[1]);
								lista125[ab-1]="1";
							}
							else {ab++;lista125[ab-1]="0";}
							if(line.contains("6")) {
								ac++;
								System.out.println(line12[1]);
								lista126[ac-1]="1";
							}
							else {ac++;lista126[ac-1]="0";}
							if(line.contains("7")) {
								ad++;
								System.out.println(line12[1]);
								lista127[ad-1]="1";
							}
							else {ad++;lista127[ad-1]="0";}
						}
						if(line.contains("}")) {
							break;
						}
					}
				}
				if(line.contains("\"13\" :")){
					while( (line = fr.readLine()) != null) {
						if(line.contains("value")) {
							line13=line.split(" :"); 
							if(line.contains("1")) {
								ae++;
								System.out.println(line13[1]);
								lista131[ae-1]="1";
							}
							else {ae++;lista131[ae-1]="0";}
							if(line.contains("2")) {
								af++;
								System.out.println(line13[1]);
								lista132[af-1]="1";
							}
							else {af++;lista132[af-1]="0";}
							if(line.contains("3")) {
								ag++;
								System.out.println(line13[1]);
								lista133[ag-1]="1";
							}
							else {ag++;lista133[ag-1]="0";}
							if(line.contains("4")) {
								ah++;
								System.out.println(line13[1]);
								lista134[ah-1]="1";
							}
							else {ah++;lista134[ah-1]="0";}
							if(line.contains("7")) {
								ai++;
								System.out.println(line13[1]);
								lista137[ai-1]="1";
							}
							else {ai++;lista137[ai-1]="0";}
						}
						if(line.contains("}")) {
							break;
						}
					}
				}

				if(line.contains("\"14\" :")){
					aj++;
					line14=line.split(" : "); 
					System.out.println(line14[1]);
					lista14[aj-1]=line14[1];
				}
				if(line.contains("\"15\" :")){
					ak++;
					line15=line.split(" : "); 
					System.out.println(line15[1]);
					lista15[ak-1]=line15[1];
				}
				if(line.contains("\"16\" :")){
					al++;
					line16=line.split(" : "); 
					System.out.println(line16[1]);
					lista16[al-1]=line16[1];
				}}				

			for (int i=0;i<159;i++) {
				csvWriter.append("\t");
				csvWriter.append(listalat[i]);
				csvWriter.append("\t");
				csvWriter.append(listalong[i]);
				csvWriter.append("\t");
				csvWriter.append(lista1[i]);
				csvWriter.append("\t");
				csvWriter.append(lista2[i]);
				csvWriter.append("\t");
				csvWriter.append(lista31[i]);
				csvWriter.append("\t");
				csvWriter.append(lista32[i]);
				csvWriter.append("\t");
				csvWriter.append(lista33[i]);
				csvWriter.append("\t");
				csvWriter.append(lista4[i]);
				csvWriter.append("\t");
				csvWriter.append(lista41[i]);
				csvWriter.append("\t");
				csvWriter.append(lista42[i]);
				csvWriter.append("\t");
				csvWriter.append(lista43[i]);
				csvWriter.append("\t");
				csvWriter.append(lista44[i]);
				csvWriter.append("\t");
				csvWriter.append(lista45[i]);
				csvWriter.append("\t");
				csvWriter.append(lista46[i]);
				csvWriter.append("\t");
				csvWriter.append(lista47[i]);
				csvWriter.append("\t");
				csvWriter.append(lista48[i]);
				csvWriter.append("\t");
				csvWriter.append(lista49[i]);
				csvWriter.append("\t");
				csvWriter.append(lista51[i]);
				csvWriter.append("\t");
				csvWriter.append(lista52[i]);
				csvWriter.append("\t");
				csvWriter.append(lista53[i]);
				csvWriter.append("\t");
				csvWriter.append(lista6[i]);
				csvWriter.append("\t");
				csvWriter.append(lista61[i]);
				csvWriter.append("\t");
				csvWriter.append(lista62[i]);
				csvWriter.append("\t");
				csvWriter.append(lista63[i]);
				csvWriter.append("\t");
				csvWriter.append(lista64[i]);
				csvWriter.append("\t");
				csvWriter.append(lista65[i]);
				csvWriter.append("\t");
				csvWriter.append(lista66[i]);
				csvWriter.append("\t");
				csvWriter.append(lista67[i]);
				csvWriter.append("\t");
				csvWriter.append(lista71[i]);
				csvWriter.append("\t");
				csvWriter.append(lista72[i]);
				csvWriter.append("\t");
				csvWriter.append(lista73[i]);
				csvWriter.append("\t");
				csvWriter.append(lista74[i]);
				csvWriter.append("\t");
				csvWriter.append(lista75[i]);
				csvWriter.append("\t");
				csvWriter.append(lista76[i]);
				csvWriter.append("\t");
				csvWriter.append(lista8[i]);
				csvWriter.append("\t");
				csvWriter.append(lista81[i]);
				csvWriter.append("\t");
				csvWriter.append(lista82[i]);
				csvWriter.append("\t");
				csvWriter.append(lista83[i]);
				csvWriter.append("\t");
				csvWriter.append(lista84[i]);
				csvWriter.append("\t");
				csvWriter.append(lista85[i]);
				csvWriter.append("\t");
				csvWriter.append(lista86[i]);
				csvWriter.append("\t");
				csvWriter.append(lista87[i]);
				csvWriter.append("\t");
				csvWriter.append(lista88[i]);
				csvWriter.append("\t");
				csvWriter.append(lista89[i]);
				csvWriter.append("\t");
				csvWriter.append(lista9[i]);
				csvWriter.append("\t");
				csvWriter.append(lista91[i]);
				csvWriter.append("\t");
				csvWriter.append(lista92[i]);
				csvWriter.append("\t");
				csvWriter.append(lista93[i]);
				csvWriter.append("\t");
				csvWriter.append(lista94[i]);
				csvWriter.append("\t");
				csvWriter.append(lista95[i]);
				csvWriter.append("\t");
				csvWriter.append(lista96[i]);
				csvWriter.append("\t");
				csvWriter.append(lista97[i]);
				csvWriter.append("\t");
				csvWriter.append(lista98[i]);
				csvWriter.append("\t");
				csvWriter.append(lista101[i]);
				csvWriter.append("\t");
				csvWriter.append(lista102[i]);
				csvWriter.append("\t");
				csvWriter.append(lista103[i]);
				csvWriter.append("\t");
				csvWriter.append(lista104[i]);
				csvWriter.append("\t");
				csvWriter.append(lista105[i]);
				csvWriter.append("\t");
				csvWriter.append(lista106[i]);
				csvWriter.append("\t");
				csvWriter.append(lista111[i]);
				csvWriter.append("\t");
				csvWriter.append(lista112[i]);
				csvWriter.append("\t");
				csvWriter.append(lista113[i]);
				csvWriter.append("\t");
				csvWriter.append(lista121[i]);
				csvWriter.append("\t");
				csvWriter.append(lista122[i]);
				csvWriter.append("\t");
				csvWriter.append(lista123[i]);
				csvWriter.append("\t");
				csvWriter.append(lista124[i]);
				csvWriter.append("\t");
				csvWriter.append(lista125[i]);
				csvWriter.append("\t");
				csvWriter.append(lista126[i]);
				csvWriter.append("\t");
				csvWriter.append(lista127[i]);
				csvWriter.append("\t");
				csvWriter.append(lista131[i]);
				csvWriter.append("\t");
				csvWriter.append(lista132[i]);
				csvWriter.append("\t");
				csvWriter.append(lista133[i]);
				csvWriter.append("\t");
				csvWriter.append(lista134[i]);
				csvWriter.append("\t");
				csvWriter.append(lista137[i]);
				csvWriter.append("\t");
				csvWriter.append(lista14[i]);
				csvWriter.append("\t");
				csvWriter.append(lista15[i]);
				csvWriter.append("\t");
				csvWriter.append(lista16[i]);

				csvWriter.append("\n");			
			}


			fr.close(); //cierro la lectura
			csvWriter.close(); //cierro el excel

		} catch (FileNotFoundException e) {
			System.out.println("An error occurred.");
			e.printStackTrace();
		} 


	}
}


