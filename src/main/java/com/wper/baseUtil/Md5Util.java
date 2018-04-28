package com.wper.baseUtil;

import java.security.MessageDigest;

/**
 * @author wper
 * MD5加密转换
 */
public class Md5Util {
    /**
     * 根据字符串获取MD5值
     * @param string 需要MD5加密的字符串
     * @return string : 16str MD5
     */
    public static String getMD5(String string){
        byte[] bMD5=null;
        try {
            MessageDigest messageDigest=MessageDigest.getInstance("MD5");
            bMD5=messageDigest.digest(string.getBytes());
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return byteArrayToHexStr(bMD5);
    }

    /**
     * byte[]转十六进制字符
     * @param byteArray 待转换的byteArray
     * @return string ：十六进制字符串
     */
    private static String byteArrayToHexStr(byte[] byteArray) {
        if (byteArray == null){
            return null;
        }
        char[] hexArray = "0123456789ABCDEF".toCharArray();
        char[] hexChars = new char[byteArray.length * 2];
        for (int j = 0; j < byteArray.length; j++) {
            int v = byteArray[j] & 0xFF;
            hexChars[j * 2] = hexArray[v >>> 4];
            hexChars[j * 2 + 1] = hexArray[v & 0x0F];
        }
        return new String(hexChars);
    }

}
