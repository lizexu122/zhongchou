package com.financing.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "`Order`")
public class Order {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;


    @ManyToOne(targetEntity = Address.class)//外键关联，查order一起把addressz
    @JoinColumn(name = "address_id",referencedColumnName = "id")
    private Address address;

    @Column(name = "create_time")
    private Date createTime;

    @ManyToOne(targetEntity = Project.class)
    @JoinColumn(name = "project_id",referencedColumnName = "id")
    private Project project;

    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_id",referencedColumnName = "id",nullable = false)
    private User user;



    @Column
    private BigDecimal amount;

    @Column
    private Byte status;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }



    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }


    @Override
    public String toString() {
        return "Order{" +
                "id='" + id + '\'' +
                ", address=" + address +
                ", createTime=" + createTime +
                ", project=" + project +
                ", user=" + user +

                ", amount=" + amount +
                ", status=" + status +
                '}';
    }
}
