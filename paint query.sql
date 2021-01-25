select distinct s2.parent_part_id, s1.child_part_id, s1.part_num, s1.rank, s2.part_version_id 
	from (select parent_part_id, part_num, child_part_id, rank, max(part_version_id) 
			from bom_line, general_part, sub_department, operation 
			where child_part_id = part_id and part_id = operation_id and part_num like '%Paint%' 
			group by parent_part_id, child_part_id, part_num, rank order by parent_part_id, rank) s1 
	join (select count(c.parent_part_id), c.parent_part_id, c.part_version_id 
			from (select count(parent_part_id) as Parent_part_count, parent_part_id, part_num, child_part_id, part_version_id 
			from bom_line ,  general_part 
			where parent_part_id = part_id 
			group by parent_part_id, part_num, part_version_id, child_part_id 
			order by parent_part_id) c
	join (select distinct max(part_version_id) as part_version 
			from bom_line 
			group by  parent_part_id 
			order by part_version) v on c.part_version_id = v.part_version group by c.parent_part_id, c.part_version_id order by c.parent_part_id) s2 
	on s1.parent_part_id = s2.parent_part_id group by s2.parent_part_id, s1.part_num , s2.part_version_id ,s1.child_part_id,s1.rank 
	order by s2.parent_part_id