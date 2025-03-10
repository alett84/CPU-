-- Control Unit Code
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity ControlUnit is

port (
	--Op code used for instructions (NOT the ALU Op)
	OpCode : in std_logic_vector(2 downto 0);
	--Clock Signal
	clk : in std_logic;
	--Load bits to basically turn components on and off at a given state
	ToALoad : out std_logic;
	ToMarLoad : out std_logic;
	ToIrLoad : out std_logic;
	ToMdriLoad : out std_logic;
	ToMdroLoad : out std_logic;
	ToPcIncrement : out std_logic := '0';
	ToMarMux : out std_logic;
	ToRamWriteEnable : out std_logic;
	--This is the ALU op code, look inside the ALU code to set this
	ToAluOp : out std_logic_vector (2 downto 0)
);

end;

architecture behavior of ControlUnit is
--Custom Data Type to Define Each State
type cu_state_type is (load_mar, read_mem, load_mdri, load_ir, decode,
						ldaa_load_mar, ldaa_read_mem, ldaa_load_mdri, ldaa_load_a,
						adaa_load_mar, adaa_read_mem, adaa_load_mdri, adaa_store_load_a,
						staa_load_mdro, staa_write_mem,
						increment_pc);

--Signal to hold current state						
signal current_state : cu_state_type;

begin
--Defines the transitions in our state machine
process(clk)
begin

if (clk'event and clk = '1') then
	case current_state is
		--Increment the pc and fetch the instruction, then load the IR with the fetched instruction
		--Decode the instruction, use the diagram in the handout to determine the next states
		when increment_pc =>
			current_state <= load_mar;
		when load_mar =>
		--INSERT CODE HERE
			
			
			
		
		--Decode Opcode to determine Instruction
		--Assign current state based on the opCode
		when decode =>
		--INSERT CODE HERE
		
		
		--Instructions, need to determine the next state to implement each instruction
		--Follow the path to perform each instruction as described in the handout, and determine
		--Where the state machine needs to go to implement the instruction
		---Load instruction
		when ldaa_load_mar =>
			current_state <= ldaa_read_mem;
			--INSERT CODE HERE
			
		--Add Instruction
		when adaa_load_mar =>
			current_state <= adaa_read_mem;
			--INSERT CODE HERE
			
		--Store Instruction
		when staa_load_mdro =>
			--INSERT CODE HERE
				
	end case;
end if;
end process;
-- Defines what happens at each state, set to '1' if we want that component to be on
-- Set Op Code accordingly based on ALU, different from the instruction op code, look at the actual ALU code
-- Keep in mind when ToMarMux = 0 , MAR is loaded from PC address, when ToMarMux = 1, MAR is loaded with IR address

process(current_state)
begin

	ToALoad <= '0';
	ToMdroLoad <= '0';
	ToAluOp <= "000";

	case current_state is
		--Turns on the increment pc bit
		when increment_pc => 
			ToALoad <= '0';
			ToPcIncrement <= '1';
			ToMarMux <= '0';
			ToMarLoad <= '0';
			ToRamWriteEnable <= '0';
			ToMdriLoad <= '0';
			ToIrLoad <= '0';
			ToMdroLoad <= '0';
			ToAluOp <= "000";		
		--Loads MAR with address from program counter
		when load_mar =>
		--INSERT CODE HERE
		
		--Reads Address located in MAR
		when read_mem =>
		--INSERT CODE HERE
		
		--Load Memory Data Register Input
		when load_mdri =>
		--INSERT CODE HERE
			
		--Loads the Instruction Register with instruction fetched from Memory
		when load_ir =>
		--INSERT CODE HERE
		
		--Decodes The current instruction (everything should be off for this)
		when decode =>
		--INSERT CODE HERE
		
		--Loads the MAR with address stored in IR
		when ldaa_load_mar =>
		--INSERT CODE HERE
		
		--Reads Data in memory retrieved from Address in MAR
		when ldaa_read_mem =>
		--INSERT CODE HERE
		
		--Loads the Memory data Register Input with data read from memory
		when ldaa_load_mdri =>
		--INSERT CODE HERE
		
		--Loads the accumulator with data held in MDRI
		when ldaa_load_a =>
		--INSERT CODE HERE
		
		--Loads the MAR with address held in IR
		when adaa_load_mar =>
		--INSERT CODE HERE
		
		--Reads Memory based on address in MAR
		when adaa_read_mem =>
		--INSERT CODE HERE
		
		--Loads MDRI with data just read from memory
		when adaa_load_mdri =>
		--INSERT CODE HERE
		
		--Loads accumulator with data in MDRI
		when adaa_store_load_a =>
		--INSERT CODE HERE
		
		--Loads MDRO with data to be written to memory (this data comes from the accumulator)
		when staa_load_mdro =>
		--INSERT CODE HERE
		
		--Writes to memory the data stored in MDRO
		when staa_write_mem =>
		--INSERT CODE HERE
		
	end case;
end process;
end behavior;
