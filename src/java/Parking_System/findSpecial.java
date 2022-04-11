/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parking_System;

/**
 *
 * @author shiva
 */
public class findSpecial {
    
    String s=null;
    String s1="dry cleaning";
    String s2="car washing";
    String s3="repair checks";
    public String calculate(int n)
    {
        if(n==1)
        {
            s=s3;
        }
        else if(n==2)
        {
            s=s2;
        }
        else if(n==3)
        {
            s=s2+" , "+s3;
        }
        else if(n==4)
        {
            s=s1;
        }
        else if(n==5)
        {
            s=s1+" , "+s3;
        }
        else if(n==6)
        {
            s=s1+" , "+s2;
        }
        else if(n==7)
        {
            s=s1+" ,"+s2+" , "+s3;
        }
    return s;
    }
}
