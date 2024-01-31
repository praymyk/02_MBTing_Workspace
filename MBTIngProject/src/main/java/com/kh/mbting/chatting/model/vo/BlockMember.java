package com.kh.mbting.chatting.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class BlockMember {
	private int blockNo;			  //BLOCKNO	NUMBER
	private String blockMemEmail; 	  //BLOCKMEMEMAIL	VARCHAR2(40 BYTE)
	private String blockProEmail; 	  //BLOCKPROEMAIL	VARCHAR2(40 BYTE)
}
