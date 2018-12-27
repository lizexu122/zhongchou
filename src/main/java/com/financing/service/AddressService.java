package com.financing.service;

import com.financing.entity.Address;
import com.financing.entity.User;

import java.util.List;

public interface AddressService {

    void addAddress(Address address);
    List<Address> getAddressList();
    List<Address> getAddressListByUser(User user);
    void deleteAddress(int id);
}
