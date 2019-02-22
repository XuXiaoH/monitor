/**
 * Author:  xxh
 * Date:    2019/2/1 15:54
 */
package com.danuooa.monitor.model;


import javax.persistence.*;

@Table(name = "server")
public class Server {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String ip;

    @Column
    private String note;

    @Column
    private Short status;

    public Long getId(){ return id; }

    public void setId(Long id){
        this.id=id;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getNote(){
        return note;
    }

    public void setNote(String note){
        this.note=note;
    }

    public Short getStatus(){
        return status;
    }

    public void setStatus(Short status){
        this.status=status;
    }
}
