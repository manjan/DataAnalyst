package com.cloudera.hive.udf;

import java.util.Arrays;
import org.apache.hadoop.hive.ql.exec.UDF;
import org.apache.hadoop.hive.ql.exec.Description;

@Description(
    name     = "calc_shipping_cost",
    value    = "_FUNC_(zipcode, weight) - calculates the cost (in " +
               "cents) to ship a package of 'weight' pounds to the " + 
               "destination 'zipcode'.", 
    extended = "Example:\n" +
               " > SELECT _FUNC_(zipcode, total_weight) FROM order_info;"
)
public class UDFCalcShippingCost extends UDF {
    // This example is meant to determine the basic structure and 
    // use of a Hive UDF. The actual logic is unimportant, and in 
    // this case, just returns a static value for a given input.
    // For added realism, this is loosely based on how ZIP codes 
    // are assigned to different states and where some of those
    // are in relation to one of Dualcore distribution centers (in 
    // other words, it's all hardcoded and is definitely not using  
    // the Haversine distance calculation).



    // Every UDF must define at least one evaluate method. In this
    // case, ours takes the zipcode (a String object) and the 
    // weight of the shipment (an Integer object), calculates 
    // a shipping cost based on this information and returns 
    // that cost as an Integer object
    public Integer evaluate(String zipcode, Integer weight) { 
        // validate the input
        if (zipcode == null || zipcode.trim().length() != 5) {
            return null;
        }

        if (weight < 1) {
            return null;
        }

        // do whatever business logic is necessary
        return calcShippingCost(zipcode, weight);
    }

    // we'll also overload the method to accept larger integer values
    public Integer evaluate(String zipcode, Long weight) { 
        return evaluate(zipcode, weight.intValue());
    }



    // Everything below here is just some hacks that simulate
    // a shipping cost calculation... there's no need to read it.

    private static final int VERY_EXPENSIVE = 10;
    private static final int FAIRLY_EXPENSIVE = 7;
    private static final int FAIRLY_INEXPENSIVE = 4;
    private static final int VERY_INEXPENSIVE = 2;

    private static final String[] expensive_zips = {
            "41372", "78750", "66554", "40213", "40934", "31706", 
            "35078", "53990", "87959", "69517", "87974", "31992", 
            "28732", "34474", "48599", "55294", "54192", "40812", 
            "61075", "64656", "96877", "68631", "35413", "85432", 
            "16274", "13333", "52062", "33564", "79575", "33755", 
            "13588", "39887", "51517", "67047", "20187", "68996", 
            "64493", "64190", "62197", "64838", "61208", "64872", 
            "62903", "62912", "63289", "62934", "64518", "61952", 
            "10138", "10169", "10339", "10461", "10674", "10774", 
            "10804", "10836", "10887", "11026", "11041", "11180", 
            "11239", "11565", "11246", "11461", "11521", "11560", 
            "45868", "25546", "29533", "42340", "26470", "77929", 
            "48155", "31539", "25242", "55571", "27242", "51259",
            "62687", "62064", "61384", "61421", "96119", "63507", 
            "61508", "93587", "61688", "64687", "63378", "91905",
            "27308", "28884", "53128", "58738", "14593", "83438", 
            "75872", "35519", "15353", "83322", "38869", "14157"};

    private static final String[] inexpensive_zips = {
            "72279", "47865", "96804", "29854", "20447", "87506",
            "52227", "77904", "86999", "69090", "43003", "85595", 
            "75722", "26462", "25215", "89093", "84768", "81014", 
            "89093", "45840", "60515", "66507", "89232", "82186",
            "10131", "10148", "10177", "10264", "10307", "10449",
            "10478", "10511", "10532", "10629", "10659", "10686",
            "10927", "10942", "10980", "11221", "11404", "11317",
            "79189", "82996", "55391", "51330", "52064", "48419",
            "39195", "69811", "48558", "77093", "77093", "70491",
            "14393", "85444", "42556", "70272", "13389", "16492",
            "11127", "25242", "43559", "83322", "80739", "74291",
            "83455", "21845", "34619", "32174", "50483", "90347",
            "96576", "50565", "26470", "26256", "55788", "82996"};


    private static int calcShippingCost(String zipcode, Integer weight) { 
       int shippingCost = 0;

       int coefficient = getCoefficientForLocation(zipcode);
       if (coefficient == VERY_EXPENSIVE) {
           shippingCost = 1400; // transit by air to Alaska or Hawaii
           shippingCost += weight * 610;
       } else if (coefficient == FAIRLY_EXPENSIVE) {
           shippingCost = 625; 
           shippingCost += weight * 140;
       } else if (coefficient == FAIRLY_INEXPENSIVE) {
           shippingCost = 360; 
           shippingCost += weight * 55;
       } else if (coefficient == VERY_INEXPENSIVE) {
           shippingCost = 240; 
           shippingCost += weight * 25;
       }

        // now add some simulated randomness to vary the values we return,
        // but it's important that the output for given input is consistent.
        shippingCost += (weight * 2) + Integer.valueOf(zipcode.substring(2,4));

        return shippingCost;
    }

    private static int getCoefficientForLocation(String zipcode) {
        // we'll intentionally make a few expensive to influence the
        // results that I want to be evident in subsequent queries
        if (Arrays.asList(expensive_zips).contains(zipcode)) {
            return FAIRLY_EXPENSIVE;
        }

        // and we'll intentionally make a few inexpensive too...
        if (Arrays.asList(inexpensive_zips).contains(zipcode)) {
            return FAIRLY_INEXPENSIVE;
        }

        // the others are loosely based on where they are located 
        // relative to one of Dualcore's distribution centers
        String firstTwoStr = zipcode.substring(0, 2);
        String firstThreeStr = zipcode.substring(0, 3);
       
        int firstTwo = Integer.valueOf(firstTwoStr);
        int firstThree = Integer.valueOf(firstThreeStr);
       
        if (firstThree >= 995) {
            // Alaska
            return VERY_EXPENSIVE;
        } else if (firstThree == 967 || firstThree == 968) {
            // Hawaii
            return VERY_EXPENSIVE; 
        }
       
        if (firstThree >= 930 && firstThree < 962) {
            // near distribution center
            return VERY_INEXPENSIVE;
        }     
        
        if (firstTwo >= 61 && firstTwo < 65) {
            // near second distribution center
            return VERY_INEXPENSIVE;
        }       

        if (firstTwo >= 90 && firstThree < 962 || firstTwo == 97 || firstTwo == 89) {
            // not too far from first distribution center
            return FAIRLY_INEXPENSIVE;
        }               
        
        if (firstTwo >= 60 && firstTwo < 63 
                || firstTwo >= 70 || firstTwo <= 75
                || firstTwo >= 40 || firstTwo <= 42) {
            // not too far from second distribution center
            return FAIRLY_INEXPENSIVE;
        }            
       
        // and for everything else, just pick a value arbitrarily (but 
        // do it deterministically so results are repeatable)
        if (firstThree % 2 == 0) {
            return FAIRLY_EXPENSIVE;
        }
       
        return FAIRLY_INEXPENSIVE;
   }


}
