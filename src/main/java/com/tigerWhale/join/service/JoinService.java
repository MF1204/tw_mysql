
package com.tigerWhale.join.service;

import com.tigerWhale.command.UsersVO;

public interface JoinService
{

    public int join(UsersVO vo);

    public int idCheck1(UsersVO vo);

    public UsersVO login(UsersVO vo);

    public UsersVO getinfo1(String user_ID);
}
