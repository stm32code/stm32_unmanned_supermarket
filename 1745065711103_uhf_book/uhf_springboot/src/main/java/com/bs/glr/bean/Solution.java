package com.bs.glr.bean;

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public static ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        long sum1 = 0;
        long sum2 = 0;
        int i = 0;
        int j = 0;
        long sum = 0;
        while(l1 !=null){
            int pow = (int)Math.pow(10, i);
            sum1 = sum1+(long)l1.val*(pow);

            i = i+1;
            l1 = l1.next;
        }
        while(l2 !=null){
            int pow = (int)Math.pow(10, j);
            sum2 = sum2+(long)l2.val*(pow);
            j = j+1;
            l2 = l2.next;
        }
        sum = sum1+sum2;
        double [] arr = new double[100];
        i = 0;
        ListNode root=new ListNode(0);
        if(sum == 0){
            ListNode sumNode = new ListNode(0);
            sumNode.val = 0;
            root.next = sumNode;
            return root.next;
        }else {
            while(sum!=0){
                arr[i] = sum%10;
                sum = sum/10;
                i=i+1;
            }
            int length = i;

            ListNode cursor = root;
            for(i =0;i<length;i++){
                ListNode sumNode = new ListNode(0);
                sumNode.val = (int)arr[i];
                cursor.next = sumNode;
                cursor = sumNode;
            }
        }

        return root.next;
    }

    public static void main(String[] args) {
        ListNode listNode10 = new ListNode(9);
//        ListNode listNode11 = new ListNode(4);
//        ListNode listNode12 = new ListNode(3);
//        listNode11.next = listNode12;
//        listNode10.next = listNode11;

        ListNode listNode20 = new ListNode(1);
        ListNode listNode21 = new ListNode(9);
        ListNode listNode22 = new ListNode(9);
        ListNode listNode23 = new ListNode(9);
        ListNode listNode24 = new ListNode(9);
        ListNode listNode25 = new ListNode(9);
        ListNode listNode26 = new ListNode(9);
        ListNode listNode27 = new ListNode(9);
        ListNode listNode28 = new ListNode(9);
        ListNode listNode29 = new ListNode(9);
        listNode28.next = listNode29;
        listNode27.next = listNode28;
        listNode26.next = listNode27;
        listNode25.next = listNode26;
        listNode24.next = listNode25;
        listNode23.next = listNode24;
        listNode22.next = listNode23;
        listNode21.next = listNode22;
        listNode20.next = listNode21;


        ListNode listNode = addTwoNumbers(listNode10, listNode20);
        System.out.println(listNode);

    }
}