#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "structs.h"
#include <inttypes.h>

int add_last(void **arr, int *len, data_structure *data)
{
	*arr = realloc(*arr, *len + sizeof(head) + data->header->len);

	memcpy(*arr + *len, data->header, sizeof(head));
	*len = *len + sizeof(head);

	memcpy(*arr + *len, data->data, data->header->len);

	*len = *len + data->header->len;
	
	return 1;
}

int add_at(void **arr, int *len, data_structure *data, int index)
{
	if(index < 0)
		return 0;

	void *cpy = arr;
	*arr = realloc(*arr, *len + sizeof(head) + data->header->len);
	int i = 0;
	int current_size = 0;
	while(current_size < *len)
	{
		unsigned int lungime = *((unsigned int *)(cpy + sizeof(int)));
		if(i == index)
		{
			memmove(*arr + current_size + sizeof(head) + data->header->len, *arr + current_size, *len - current_size);
			memcpy(*arr + current_size, data->header, sizeof(head));
			memcpy(*arr + current_size + sizeof(head), data->data, data->header->len);
			*len = *len + sizeof(head) + data->header->len;
			return 0;
		}
		current_size += sizeof(head) + lungime;
		cpy = cpy + sizeof(head) + lungime;
		i++;
	}

	add_last(arr, len, data);
	return 0;
}

void find(void *data_block, int len, int index) 
{
	if(index < 0)
		return;

	int current_size = 0;
	int i = 0;
	while(current_size < len)
	{
		unsigned int lungime = *((unsigned int *)(data_block + sizeof(int)));
		if(i == index)
		{
			int type = *(unsigned char *)(data_block);
			char *dedicator = (char *)(data_block + sizeof(head));
			if(type == 1)
			{
				int8_t prima = *((int8_t *)(data_block + sizeof(head) + strlen(dedicator) + 1));
				int8_t doua = *((int8_t *)(data_block + sizeof(head) + strlen(dedicator) + 1 + sizeof(int8_t)));
				char *dedicat = (char *)(data_block + sizeof(head) + strlen(dedicator) + 2 * sizeof(int8_t) + 1);
				printf("Tipul %d\n%s pentru %s\n%"PRId8"\n%"PRId8"\n\n", type, dedicator, dedicat, prima, doua);
			}
			if(type == 2)
			{
				int16_t prima = *((int16_t *)(data_block + sizeof(head) + strlen(dedicator) + 1));
				int32_t doua = *((int32_t *)(data_block + sizeof(head) + strlen(dedicator) + 1 + sizeof(int16_t)));
				char *dedicat = (char *)(data_block + sizeof(head) + strlen(dedicator) + sizeof(int16_t) + sizeof(int32_t) + 1);
				printf("Tipul %d\n%s pentru %s\n%"PRId16"\n%"PRId32"\n\n", type, dedicator, dedicat, prima, doua);
			}
			if(type == 3)
			{
				int32_t prima = *((int32_t *)(data_block + sizeof(head) + strlen(dedicator) + 1));
				int32_t doua = *((int32_t *)(data_block + sizeof(head) + strlen(dedicator) + 1 + sizeof(int32_t)));
				char *dedicat = (char *)(data_block + sizeof(head) + strlen(dedicator) + sizeof(int32_t) + sizeof(int32_t) + 1);
				printf("Tipul %d\n%s pentru %s\n%"PRId32"\n%"PRId32"\n\n", type, dedicator, dedicat, prima, doua);
			}
			return;
		}
		current_size += sizeof(head) + lungime;
		data_block = data_block + sizeof(head) + lungime;
		i++;
	}
}

int delete_at(void **arr, int *len, int index)
{
	if(index < 0)
		return 0;

	int i = 0;
	int current_size = 0;

	void *cpy = *arr;

	while(current_size < *len)
	{
		unsigned int lungime = *((unsigned int *)(cpy + sizeof(int)));
		if(i == index)
		{
			memmove(*arr + current_size, *arr + current_size + sizeof(head) + lungime, *len - current_size - sizeof(head) - lungime);
			*arr = realloc(*arr, *len - sizeof(head) - lungime);
			*len = *len - sizeof(head) - lungime;
			return 0;
		}
		current_size += sizeof(head) + lungime;
		cpy = cpy + sizeof(head) + lungime;
		i++;
	}

	return 0;
}

void print(void *arr, int len)
{
	int current_size = 0;
	while(current_size < len)
	{
		int type = *(unsigned char *)(arr);
		unsigned int lungime = *((unsigned int *)(arr + sizeof(int)));
		char *dedicator = (char *)(arr + sizeof(head));
		if(type == 1)
		{
			int8_t prima = *((int8_t *)(arr + sizeof(head) + strlen(dedicator) + 1));
			int8_t doua = *((int8_t *)(arr + sizeof(head) + strlen(dedicator) + 1 + sizeof(int8_t)));
			char *dedicat = (char *)(arr + sizeof(head) + strlen(dedicator) + 2 * sizeof(int8_t) + 1);
			printf("Tipul %d\n%s pentru %s\n%"PRId8"\n%"PRId8"\n\n", type, dedicator, dedicat, prima, doua);
		}
		if(type == 2)
		{
			int16_t prima = *((int16_t *)(arr + sizeof(head) + strlen(dedicator) + 1));
			int32_t doua = *((int32_t *)(arr + sizeof(head) + strlen(dedicator) + 1 + sizeof(int16_t)));
			char *dedicat = (char *)(arr + sizeof(head) + strlen(dedicator) + sizeof(int16_t) + sizeof(int32_t) + 1);
			printf("Tipul %d\n%s pentru %s\n%"PRId16"\n%"PRId32"\n\n", type, dedicator, dedicat, prima, doua);
		}
		if(type == 3)
		{
			int32_t prima = *((int32_t *)(arr + sizeof(head) + strlen(dedicator) + 1));
			int32_t doua = *((int32_t *)(arr + sizeof(head) + strlen(dedicator) + 1 + sizeof(int32_t)));
			char *dedicat = (char *)(arr + sizeof(head) + strlen(dedicator) + sizeof(int32_t) + sizeof(int32_t) + 1);
			printf("Tipul %d\n%s pentru %s\n%"PRId32"\n%"PRId32"\n\n", type, dedicator, dedicat, prima, doua);
		}
		current_size += sizeof(head) + lungime;
		arr = arr + sizeof(head) + lungime;
	}
}

void iesire(void **arr, data_structure **data)
{
	free(*arr);
	free(*data);
}

void parsare_insert(data_structure *elemente, char *cuv)
{
	elemente->header = calloc(1, sizeof(head));
	cuv = strtok(NULL, " ");
	int type = atoi(cuv);
	if (type == 1)
	{
		elemente->header->type = 1;
		cuv = strtok(NULL, " \n");
		char *dedicator = cuv;
		cuv = strtok(NULL, " \n");
		int8_t prima = atoi(cuv);
		cuv = strtok(NULL, " \n");
		int8_t doua = atoi(cuv);
		cuv = strtok(NULL, " \n");
		char *dedicat = cuv;

		elemente->header->len = strlen(dedicator) + sizeof(int8_t) + sizeof(int8_t) + strlen(dedicat) + 2;

		elemente->data = (void *)calloc(1, elemente->header->len);

		memcpy(elemente->data, dedicator, strlen(dedicator) + 1);
		memcpy(elemente->data + strlen(dedicator) + 1, &prima, sizeof(int8_t));
		memcpy(elemente->data + strlen(dedicator) + 1 + sizeof(int8_t), &doua, sizeof(int8_t));
		memcpy(elemente->data + strlen(dedicator) + 1 + 2 * sizeof(int8_t), dedicat, strlen(dedicat) + 1);
	}
	if (type == 2)
	{
		elemente->header->type = 2;
		cuv = strtok(NULL, " '\n'");
		char *dedicator = cuv;
		cuv = strtok(NULL, " \n");
		int16_t prima = atoi(cuv);
		cuv = strtok(NULL, " \n");
		int32_t doua = atoi(cuv);
		cuv = strtok(NULL, " '\n'");
		char *dedicat = cuv;

		elemente->header->len = strlen(dedicator) + sizeof(int16_t) + sizeof(int32_t) + strlen(dedicat) + 2;

		elemente->data = (void *)calloc(1, elemente->header->len);
		
		memcpy(elemente->data, dedicator, strlen(dedicator) + 1);
		memcpy(elemente->data + strlen(dedicator) + 1, &prima, sizeof(int16_t));
		memcpy(elemente->data + strlen(dedicator) + 1 + sizeof(int16_t), &doua, sizeof(int32_t));
		memcpy(elemente->data + strlen(dedicator) + 1 + sizeof(int16_t) + sizeof(int32_t), dedicat, strlen(dedicat) + 1);
	}
	if (type == 3)
	{
		elemente->header->type = 3;
		cuv = strtok(NULL, " \n");
		char *dedicator = cuv;
		cuv = strtok(NULL, " \n");
		int32_t prima = atoi(cuv);
		cuv = strtok(NULL, " \n");
		int32_t doua = atoi(cuv);
		cuv = strtok(NULL, " \n");
		char *dedicat = cuv;

		elemente->header->len = strlen(dedicator) + sizeof(int32_t) + sizeof(int32_t) + strlen(dedicat) + 2;

		elemente->data = (void *)calloc(1, elemente->header->len);

		memcpy(elemente->data, dedicator, strlen(dedicator) + 1);
		memcpy(elemente->data + strlen(dedicator) + 1, &prima, sizeof(int32_t));
		memcpy(elemente->data + strlen(dedicator) + 1 + sizeof(int32_t), &doua, sizeof(int32_t));
		memcpy(elemente->data + strlen(dedicator) + 1 + sizeof(int32_t) + sizeof(int32_t), dedicat, strlen(dedicat) + 1);
	}
}

void parsare_insert_at(data_structure *elemente, char *cuv)
{
	elemente->header = calloc(1, sizeof(head));
	cuv = strtok(NULL, " ");
	int type = atoi(cuv);
	if (type == 1)
	{
		elemente->header->type = 1;
		cuv = strtok(NULL, " ");
		char *dedicator = cuv;
		cuv = strtok(NULL, " \n");
		int8_t prima = atoi(cuv);
		cuv = strtok(NULL, " \n");
		int8_t doua = atoi(cuv);
		cuv = strtok(NULL, " \n");
		char *dedicat = cuv;

		elemente->header->len = strlen(dedicator) + sizeof(int8_t) + sizeof(int8_t) + strlen(dedicat) + 2;

		elemente->data = (void *)calloc(1, elemente->header->len);

		memcpy(elemente->data, dedicator, strlen(dedicator) + 1);
		memcpy(elemente->data + strlen(dedicator) + 1, &prima, sizeof(int8_t));
		memcpy(elemente->data + strlen(dedicator) + 1 + sizeof(int8_t), &doua, sizeof(int8_t));
		memcpy(elemente->data + strlen(dedicator) + 1 + 2 * sizeof(int8_t), dedicat, strlen(dedicat) + 1);
	}
	if (type == 2)
	{
		elemente->header->type = 2;
		cuv = strtok(NULL, " ");
		char *dedicator = cuv;
		cuv = strtok(NULL, " \n");
		int16_t prima = atoi(cuv);
		cuv = strtok(NULL, " \n");
		int32_t doua = atoi(cuv);
		cuv = strtok(NULL, " \n");
		char *dedicat = cuv;

		elemente->header->len = strlen(dedicator) + sizeof(int16_t) + sizeof(int32_t) + strlen(dedicat) + 2;

		elemente->data = (void *)calloc(1, elemente->header->len);

		memcpy(elemente->data, dedicator, strlen(dedicator) + 1);
		memcpy(elemente->data + strlen(dedicator) + 1, &prima, sizeof(int16_t));
		memcpy(elemente->data + strlen(dedicator) + 1 + sizeof(int16_t), &doua, sizeof(int32_t));
		memcpy(elemente->data + strlen(dedicator) + 1 + sizeof(int16_t) + sizeof(int32_t), dedicat, strlen(dedicat) + 1);
	}
	if (type == 3)
	{
		elemente->header->type = 3;
		cuv = strtok(NULL, " ");
		char *dedicator = cuv;
		cuv = strtok(NULL, " \n");
		int32_t prima = atoi(cuv);
		cuv = strtok(NULL, " \n");
		int32_t doua = atoi(cuv);
		cuv = strtok(NULL, " \n");
		char *dedicat = cuv;

		elemente->header->len = strlen(dedicator) + sizeof(int32_t) + sizeof(int32_t) + strlen(dedicat) + 2;

		elemente->data = (void *)calloc(1, elemente->header->len);

		memcpy(elemente->data, dedicator, strlen(dedicator) + 1);
		memcpy(elemente->data + strlen(dedicator) + 1, &prima, sizeof(int32_t));
		memcpy(elemente->data + strlen(dedicator) + 1 + sizeof(int32_t), &doua, sizeof(int32_t));
		memcpy(elemente->data + strlen(dedicator) + 1 + sizeof(int32_t) + sizeof(int32_t), dedicat, strlen(dedicat) + 1);
	}
}

int main() {
	// the vector of bytes u have to work with
	// good luck :)
	void *arr = NULL;
	int len = 0;
	
	data_structure *elemente = (data_structure *)malloc(sizeof(data_structure));
	arr = calloc(1, sizeof(arr));


	char *line = (char *)malloc(256 * sizeof(char));
	while(fgets(line, 256, stdin))
	{
		if(strcmp(line, "exit\n") == 0)
		{
			iesire(&arr, &elemente);
			break;
		}
		char *cuv = strtok(line, " \n");
		char *command = cuv;
		if(strcmp(command, "insert") == 0)
		{
			parsare_insert(elemente, cuv);
			add_last(&arr, &len, elemente);
			free(elemente->data);
			free(elemente->header);
		}
		if(strcmp(command, "insert_at") == 0)
		{
			cuv = strtok(NULL, " ");
			int index = atoi(cuv);
			parsare_insert_at(elemente, cuv);
			add_at(&arr, &len, elemente, index);
			free(elemente->data);
			free(elemente->header);
		}
		if(strcmp(command, "print") == 0)
		{
			print(arr, len);
		}
		if(strcmp(command, "find") == 0)
		{
			cuv = strtok(NULL, " \n");
			int index = atoi(cuv);
			find(arr, len, index);
		}
		if(strcmp(command, "delete_at") == 0)
		{
			cuv = strtok(NULL, " \n");
			int index = atoi(cuv);
			delete_at(&arr, &len, index);
		}
	}
	free(line);
	return 0;
}
