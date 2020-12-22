package com.hklmart.service;
import com.hklmart.domain.UserDetailsVO;
import com.hklmart.persistence.MemberDAO;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    private final MemberDAO member;
   
    public UserDetailsServiceImpl(MemberDAO mapper) {
        this.member = mapper;
    }

    @Override
    public UserDetails loadUserByUsername(String memberId) {
        UserDetailsVO userDetails = member.getMemberInfo(memberId);
        if (userDetails == null) { return null; }
        else {
            userDetails.setUsername(userDetails.getMemberId());
            userDetails.setPassword(userDetails.getMemberPw());
            userDetails.setAuthorities(userDetails.getAuthoritiesMember(), userDetails.getAuthoritiesManager(), userDetails.getAuthoritiesAdmin());
        }
        return userDetails;
    }

}