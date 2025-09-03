package com.bs.glr.bean;

/**
 * @作者 GLQ
 * @时间 2022-12-17 20:23
 * @描述
 */
public class ListNode {
    int val;
    ListNode next;

    ListNode() {
    }

    ListNode(int val) {
        this.val = val;
    }

    ListNode(int val, ListNode next) {
        this.val = val;
        this.next = next;
    }
}
